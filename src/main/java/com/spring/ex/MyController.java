package com.spring.ex;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.CartListVO;
import com.spring.ex.dto.CartVO;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.OrderVO;
import com.spring.ex.dto.PagingVO;
import com.spring.ex.dto.ProductDto;
import com.spring.ex.dto.RefundDto;
import com.spring.ex.dto.SellDto;
import com.spring.ex.service.ServiceTurtle;
import com.spring.ex.service.TurtleService;
import com.spring.ex.utils.UploadFileUtils;

@Controller
public class MyController {
	
	@Inject
	TurtleService service;
	
	@Inject
	public MyController(TurtleService service) {
		this.service = service;
	}
	
	// 로그인시 필요
	@Autowired
	private ServiceTurtle ServiceTurtle;

	// 메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) throws Exception {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<ProductDto> list = service.productList(map);
		
		model.addAttribute("productList",list);
		
		return "Main/main";
	}
	
	//검색 결과 페이지 
	@RequestMapping(value = "/Search", method = RequestMethod.GET)
	public String Search() throws Exception {
		return "Main/Search";
	}
	
	//검색결과 메소드 
	@RequestMapping(value = "/productSearch", method = RequestMethod.POST)
	public String productSearch(Model model, ProductDto dto, HttpServletRequest request) throws Exception {
		
		String keyword = request.getParameter("keyword");
		
		List<ProductDto> list5 = service.productSearch(keyword);	
		
		model.addAttribute("productList",list5);
		return "Main/Search";
	}
	
	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() throws Exception {
		return "Login/join";
	}
	
	//아이디 중복체크
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	@ResponseBody
	public int idChk(MemberDto mdto) throws Exception {
		int result = ServiceTurtle.idChk(mdto);
		return result;
	}
	
	// 회원가입 후 메인페이지로 보내
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String joinPOST(MemberDto dto) throws Exception {
		int result = service.idChk(dto);
		try {
			if(result == 1) {
				return "Login/join";
			}else if(result == 0) {
				
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		service.register(dto);
		return "redirect:/main";
	}
	
	// 로그인시 보이는화면
	@RequestMapping(value = "/LoginSuccess", method = RequestMethod.GET)
	public String Login(Model model) throws Exception {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<ProductDto> list = service.productList(map);
		
		model.addAttribute("productList", list);
		
		return "Login/LoginSuccess";
	}
	
	// 로그인시 보이는화면
	@RequestMapping(value = "/LoginSuccess", method = RequestMethod.POST)
	public String Login(MemberDto ldto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

	    String path = "";
	    HttpSession session = req.getSession();

	    MemberDto login = ServiceTurtle.login(ldto);
	    if (login == null) {
	       session.setAttribute("member", null);
	       rttr.addFlashAttribute("msg", false);
	       path = "redirect:/main";
	    } else {
	       session.setAttribute("member", login);
	       rttr.addFlashAttribute("msg3", false);
	       path = "redirect:/LoginSuccess";
	    }

	    return path;
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberDto ldto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		String path = "";
		
		HttpSession session = req.getSession();

	    MemberDto login = ServiceTurtle.login(ldto);
	    if (login == null) {
	       session.setAttribute("member", null);
	       path = "redirect:/main";
	    } else {
	       session.setAttribute("member", login);
	       path = "redirect:/LoginSuccess";
	    }
		
		return path;
		
	}
	
	// 비회원 배송조회
	@RequestMapping(value = "/JumunSearch2", method = RequestMethod.GET)
	public String JumunSearch2(Model model) throws Exception {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<ProductDto> list = service.productList(map);
		List<MemberDto> list2 = service.memberList();
		List<JumunDto> list3 = service.jumunList();
		
		model.addAttribute("productList", list);
		model.addAttribute("memberList", list2);
		model.addAttribute("jumunList", list3);
		
		return "Login/JumunSearch2";
	}
	
	// 비회원 배송조회
	@RequestMapping(value = "/blogin", method = RequestMethod.POST)
	public String blogin(JumunDto ldto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		String path = "";
		HttpSession session = req.getSession();

		JumunDto blogin = ServiceTurtle.blogin(ldto);
		if (blogin == null) {
		   session.setAttribute("blogin", null);
		   rttr.addFlashAttribute("msg10", false);
		   path = "redirect:/main";
		} else {
		   session.setAttribute("blogin", blogin);
		   path = "redirect:/JumunSearch2";
		}
		return path;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpSession session, RedirectAttributes rttr) throws Exception {
		session.invalidate();
		rttr.addFlashAttribute("msg2",false);
		return "redirect:/main";
	}
	
	// 아이디, 비밀번호찾기 페이지
	@RequestMapping(value = "/idSearch", method = RequestMethod.GET)
	public String idSearch() throws Exception {
		return "Login/idSearch";
	}
	
	// 아이디 찾기 
	@RequestMapping(value = "/LoginActionId", method = RequestMethod.POST)
	public String FindId(MemberDto mIdDto,HttpServletRequest req,RedirectAttributes rttr) throws Exception {
		String path = "";
		HttpSession session5 = req.getSession();
		MemberDto login = ServiceTurtle.memberId(mIdDto);
		if (login == null) {
			rttr.addFlashAttribute("msg5", false);
			path = "redirect:/idSearch";
		} else {
			session5.setAttribute("member5", login);
			rttr.addFlashAttribute("msg5", true);
			path = "redirect:/idSearch";
		}
		return path;
	}
		
	// 비밀번호 찾기 
	@RequestMapping(value ="/LoginActionPw", method = RequestMethod.POST)
	public String FindPw(MemberDto mPwDto,HttpServletRequest req,RedirectAttributes rttr) throws Exception {
		String path = "";
		HttpSession session6 = req.getSession();
		MemberDto login = ServiceTurtle.memberPw(mPwDto);
		if (login == null) {
			rttr.addFlashAttribute("msg7", false);
			path = "redirect:/idSearch";
		} else {
			session6.setAttribute("member6", login);
			rttr.addFlashAttribute("msg7", true);
			path = "redirect:/idSearch";
		}
		return path;
	}
	
	// 헬스기구 페이지 Health
	@RequestMapping(value = "/Health", method = RequestMethod.GET)
	public String Health(Model model,HttpServletRequest request) throws Exception {
			
		int totalCount = service.healthTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			
		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(6);
		paging.setTotalCount(totalCount);
			
		page = (page - 1) * 6;
			
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		List<ProductDto> list = service.HealthList(map);
			
		model.addAttribute("HealthList",list);
		model.addAttribute("Paging", paging);
		return "Main/Health";
	}
		
	// 요가상품 페이지 Yoga
	@RequestMapping(value = "/Yoga", method = RequestMethod.GET)
	public String Yoga(Model model,HttpServletRequest request) throws Exception {
			
		int totalCount = service.yogaTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			
		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(6);
		paging.setTotalCount(totalCount);
			
		page = (page - 1) * 6;
			
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		List<ProductDto> list = service.YogaList(map);
			
		model.addAttribute("YogaList",list);
		model.addAttribute("Paging", paging);
		return "Main/Yoga";
	}
		 
	// 운동식품 페이지 Food
	@RequestMapping(value = "/Food", method = RequestMethod.GET)
	public String Food(Model model,HttpServletRequest request) throws Exception {
			
		int totalCount = service.foodTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			
		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(6);
		paging.setTotalCount(totalCount);
			
		page = (page - 1) * 6;
			
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		List<ProductDto> list = service.FoodList(map);
			
		model.addAttribute("FoodList",list);
		model.addAttribute("Paging", paging);
		return "Main/Food";
	}
	
	// 남성랭킹 페이지
	@RequestMapping(value = "/ManRanking", method = RequestMethod.GET)
	public String ManRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.manRanking();
			
		model.addAttribute("manRanking", list);
			
		return "Ranking/ManRanking";
	}
	
	// 여성랭킹 페이지
	@RequestMapping(value = "/WomanRanking", method = RequestMethod.GET)
	public String WomanRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.womanRanking();
			
		model.addAttribute("womanRanking", list);
			
		return "Ranking/WomanRanking";
	}
	
	// 헬스기구랭킹 페이지
	@RequestMapping(value = "/HealthRanking", method = RequestMethod.GET)
	public String HealthRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.healthRanking();
		
		model.addAttribute("healthRanking", list);
		
		return "Ranking/HealthRanking";
	}
		
	// 요가상품랭킹 페이지
	@RequestMapping(value = "/YogaRanking", method = RequestMethod.GET)
	public String YogaRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.yogaRanking();
		
		model.addAttribute("yogaRanking", list);
		
		return "Ranking/YogaRanking";
	}

	// 운동식품랭킹 페이지
	@RequestMapping(value = "/FoodRanking", method = RequestMethod.GET)
	public String FoodRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.foodRanking();
		
		model.addAttribute("foodRanking", list);
		
		return "Ranking/FoodRanking";
	}
	
	// 상품정보 상세보기 페이지
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<ProductDto> list = service.productList(map);
		
		model.addAttribute("productList", list);
		
		return "Cash/product";
	}
	
	// 상품정보 상세보기 페이지
	@RequestMapping(value="/product", method=RequestMethod.POST)
	public String product(ProductDto pdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
			
		String path="";
		HttpSession session2 = req.getSession();
		ProductDto product2 = ServiceTurtle.product(pdto);
		if(product2 == null) {
			session2.setAttribute("product", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/main";
		} else {
			session2.setAttribute("product", product2);
			path = "redirect:/product";
		}
		return path;
	}
	
	// 장바구니 페이지
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String basket(HttpSession session, Model model) throws Exception {
		 
		MemberDto member = (MemberDto)session.getAttribute("member");
		String mId = member.getmId();
		
		List<CartListVO> cartList = service.cartList(mId);
		
		model.addAttribute("cartList", cartList);
		
		return "Login/basket";
	}
	
	// 카트 담기
		@ResponseBody
		@RequestMapping(value = "/addCart", method = RequestMethod.POST)
		public int addCart(CartVO cart, HttpSession session) throws Exception {
			 
			int result = 0;
			 
			MemberDto member = (MemberDto)session.getAttribute("member");
			ProductDto product = (ProductDto)session.getAttribute("product");
			 if(member != null) {
			 	cart.setmId(member.getmId());
			 	cart.setpNum(product.getpNum());
			 	cart.setpPrice(product.getpPrice());
			 	cart.setpName(product.getpName());
			 	cart.setpUrl(product.getpUrl());
			 	cart.setpCate(product.getpCate());
//			 	cart.setpShip(product.getpShip());
			 	service.addCart5(cart);
			 	result = 1;
			 }
			return result;
		}
	
	// 장바구니에서 상품 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
		 
		int result = 0;
		int cartNum = 0;
		 
			for(String i : chArr) {   
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}   
			result = 1;
		return result;  
	}
	
	// 장바구니에서 결제하기
	@ResponseBody
	@RequestMapping(value = "/basket", method = RequestMethod.POST)
	public int order(HttpSession session, MemberDto mdto, JumunDto jdto,  OrderVO order, CartVO cart, ProductDto pudto,
			@RequestParam(value = "chbox[]", required=false) List<String> chArr, 
			@RequestParam(value = "chbox2[]", required=false) List<String> chArr2,
			@RequestParam(value="userAddr1") String userAddr1,
			@RequestParam(value="userAddr2") String userAddr2,
			@RequestParam(value="userAddr3") String userAddr3,
			@RequestParam(value="jMemo") String jMemo,
			@RequestParam(value="jPhone") String jPhone,
			@RequestParam(value="pMan") String pMan,
			@RequestParam(value="pWoman") String pWoman , @RequestParam(value="jMile") String jMile) throws Exception {
		int cartNum = 0;
		int pNum = 0;
		int result = 0;
		
		MemberDto member = (MemberDto) session.getAttribute("member");

		String mId = member.getmId();
		String mName = member.getmName();
		String mEmail = member.getmEmail();

		String subNum = "";

		for (int j = 1; j <= 6; j++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = subNum;

		order.setOrderId(orderId);
		order.setmId(mId);
		order.setjCatchName(mName);
		order.setjEmail(mEmail);
		order.setUserAddr1(userAddr1);
		order.setUserAddr2(userAddr2);
		order.setUserAddr3(userAddr3);
		order.setjMemo(jMemo);
		order.setjPhone(jPhone);
		order.setjMile(jMile);
		for (String i : chArr) {
			cartNum = Integer.parseInt(i);
			order.setCartNum(cartNum);
			
			service.orderInfo(order);
		}
		pudto.setmId(mId);
		pudto.setpMan(pMan);
		pudto.setpWoman(pWoman);
		mdto.setmId(mId);
		for (String i : chArr2) {
			pNum = Integer.parseInt(i);
			pudto.setpNum(pNum);
			mdto.setpNum(pNum);
			service.productDecrease3(pudto);
			service.productDecrease2(pudto);
			
			service.productDecrease4(mdto);
		}
		
		for (String i : chArr) {
			cartNum = Integer.parseInt(i);
			cart.setCartNum(cartNum);
			service.deleteCart(cart);
		}
		
		mdto.setmId(mId);
		mdto.setpNum(pNum);
		mdto.setjNum(subNum);
		service.cashMile3(mdto);
		
		result = 1;
		return result;
	}
	
	// 주문조회 페이지
	@RequestMapping(value = "/JumunSearch", method = RequestMethod.GET)
	public String JumunSearch(Model model) throws Exception {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<ProductDto> list = service.productList(map);
		List<MemberDto> list2 = service.memberList();
		List<JumunDto> list3 = service.jumunList();
		
		model.addAttribute("productList", list);
		model.addAttribute("memberList", list2);
		model.addAttribute("jumunList", list3);
		
		return "Login/JumunSearch";
	}
	
	// 주문상품 상세보기 페이지
	@RequestMapping(value = "/DetailOrder", method = RequestMethod.GET)
	public String DetailOrder(Model model) throws Exception {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<ProductDto> list = service.productList(map);
		List<MemberDto> list2 = service.memberList();
		
		model.addAttribute("productList", list);
		model.addAttribute("memberList", list2);
		
		return "Cash/DetailOrder";
	}
	
	// 주문상품 상세보기 페이지
	@RequestMapping(value="/DetailOrder", method=RequestMethod.POST)
	public String DetailOrder(JumunDto pdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
			
		String path="";
		HttpSession session3 = req.getSession();
		JumunDto jumun2 = ServiceTurtle.jumun(pdto);
		if(jumun2 == null) {
			session3.setAttribute("jumun", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/main";
		} else {
			session3.setAttribute("jumun", jumun2);
			path = "redirect:/DetailOrder";
		}
		return path;
	}

	// 결제창 페이지
	@RequestMapping(value = "/CashOn", method = RequestMethod.GET)
	public String CashOn(Model model) throws Exception {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<ProductDto> list = service.productList(map);
			
		model.addAttribute("productList", list);
			
		return "Cash/CashOn";
	}
	// 바로결제
	@RequestMapping(value = "/Cash", method = RequestMethod.POST)
	public String Cash(ProductDto pdto, HttpServletRequest req, RedirectAttributes rttr, Model model) throws Exception {
		
		String pCountsSell = req.getParameter("pCountsSell");
		String sum = req.getParameter("sum");
			
		String path="";
		HttpSession session5 = req.getSession();
		HttpSession session1 = req.getSession();
		ProductDto product2 = ServiceTurtle.product(pdto);
		if(product2 == null) {
			session5.setAttribute("product", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/product";
		} else {
			session1.setAttribute("pCountsSell", pCountsSell);
			session1.setAttribute("sum", sum);
			session5.setAttribute("product", product2);
			path = "redirect:/CashOn";
		}
		return path;
	}
			
	//결제하기
	@RequestMapping(value = "CashOk", method = RequestMethod.POST)
	public String CashOk(JumunDto cldto, ProductDto pudto, MemberDto cmdto, HttpServletRequest request) throws Exception {
		
		
		
		String subNum = "";

		for (int j = 1; j <= 6; j++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = subNum;
		cldto.setjNum(orderId);
		
		ServiceTurtle.cashOk(cldto);
		ServiceTurtle.productDecrease(pudto);
		service.cashMile(cmdto);
		
		
		cmdto.setjNum(subNum);
		service.cashMile3(cmdto);
		
//		MemberDto member = service.login(cmdto);
//		
//		HttpSession session = request.getSession();
//	    session.setAttribute("member", member);
		
		return "redirect:/JumunSearch";
	}
	
	// 환불조회 페이지
	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	public String refund(Model model) throws Exception {
		
		List<JumunDto> list = service.jumunList();
		
		model.addAttribute("jumunList", list);
		
		return "Cash/refund";
	}
	
	// 주문신청 취소하기
	@RequestMapping(value = "/jumundelete", method = RequestMethod.POST)
	public String jumundelete(JumunDto jddto) throws Exception {
		
			service.jumundelete(jddto);
			return "redirect:/refund";
				
	}
	
	// 환불상품 상세보기 페이지
	@RequestMapping(value = "/DetailRefund", method = RequestMethod.GET)
	public String DetailRefund(Model model) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<ProductDto> list = service.productList(map);
		List<MemberDto> list2 = service.memberList();
			
		model.addAttribute("productList", list);
		model.addAttribute("memberList",list2);
		
		return "Cash/DetailRefund";
	}
	
	// 환불상품 상세보기 세션유지 페이지
	@RequestMapping(value="/DetailRefund", method=RequestMethod.POST)
	public String DetailRefund(JumunDto pdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
				
		String path="";
		HttpSession session3 = req.getSession();
		JumunDto jumun2 = ServiceTurtle.jumun(pdto);
		if(jumun2 == null) {
			session3.setAttribute("jumun", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/main";
		} else {
			session3.setAttribute("jumun", jumun2);
			path = "redirect:/DetailRefund";
		}
		return path;
	}
	
	// 환불요청 게시판작성 페이지
	@RequestMapping("/RefundWrite")
	public String RefundWrite() {
		return "Board/RefundWrite";
	}
	
	// 환불요청 게시판작성 페이지(세션값주기)
	@RequestMapping(value="/RefundWrite", method=RequestMethod.POST)
	public String RefundWrite(JumunDto pdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
			
		String path="";
		HttpSession session3 = req.getSession();
		JumunDto jumun2 = ServiceTurtle.jumun(pdto);
		if(jumun2 == null) {
			session3.setAttribute("jumun", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/main";
		} else {
			session3.setAttribute("jumun", jumun2);
			path = "redirect:/RefundWrite";
		}
		return path;
	}
	
	// 환불요청 환불신청 글쓴후 DB보내기
	@RequestMapping(value = "/refundwrite", method = RequestMethod.POST)
	public String refundwrite(RefundDto rwDto, MultipartFile file, HttpServletRequest request, JumunDto jrDto) throws Exception {
		
		//파일 업로드
		String imgUploadPath = request.getSession().getServletContext().getRealPath("/resources/assets/img");
		
		String fileName = null;
		
		if(file != null) {
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes()); 
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
		}


		rwDto.setrImg(File.separator + File.separator + fileName);
		
		
		service.refundWrite(rwDto);
		service.refundJumun(jrDto);
		
		return "redirect:/refund";
	}
	
	// 고객문의게시판
	@RequestMapping(value = "/CustomerWriteView", method = RequestMethod.GET)
	public String CustomerWriteView(Model model,HttpServletRequest request) throws Exception {
		int totalCount = service.boardTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		
		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 10;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		
		List<BoardDTO> list = service.BoardList(map);
		
		model.addAttribute("boardList",list);
		model.addAttribute("Paging", paging);
		
		return "Board/CustomerWriteView";
	}
	
	// 고객문의 게시판 글보기
	@RequestMapping("/CustomerWriteAnswer")
	public String CutomerWriteAnswer(){
		
		return "Board/CustomerWriteAnswer";
			
	}
	
	// 고객문의 게시판 글보기(세션값주기)
	@RequestMapping(value="/CustomerWriteAnswer", method=RequestMethod.POST)
	public String CustomerWriteAnswer(BoardDTO bdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
					
		String path="";
		HttpSession session2 = req.getSession();
		BoardDTO board = ServiceTurtle.board2(bdto);
		if(board == null) {
			session2.setAttribute("board", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/main";
		} else {
			session2.setAttribute("board", board);
			path = "redirect:/CustomerWriteAnswer";
		}
		return path;
	}
	
	// 고객문의 게시글 삭제하기(글쓴 장본인이면 가능)
	@RequestMapping(value = "/boardDelete2", method = RequestMethod.POST)
	public String boardDelete2(BoardDTO bddto) throws Exception {

		service.boardDelete(bddto);
		return "redirect:/CustomerWriteView";
			
	}
	
	// 고객문의 글쓰기 페이지
	@RequestMapping(value = "/CustomerWrite", method = RequestMethod.GET)
	public String CustomerWrite() throws Exception {
		return "Board/CustomerWrite";
	}
	
	// 고객문의 글쓰기 후 고객게시판페이지로 보내
	@RequestMapping(value = "/writeAction", method = RequestMethod.POST)
	public String boardPOST(BoardDTO bdto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.boardWrite(bdto);
		
		return "redirect:/CustomerWriteView";
	}
	
	// 회원정보 수정 페이지
	@RequestMapping("/MyPage")
	public String MyPage() {
		return "Login/MyPage";
	}
	
	// 회원정보 수정
	@RequestMapping(value="/MyPage",method = RequestMethod.POST)
	public String MyPageUpdate(MemberDto mDto,HttpSession session) throws Exception{
		
		service.MemberUpdate(mDto);

		session.invalidate(); 
		
		return "redirect:/MyPage";
	}
	
	// 회원 탈퇴 get
	@RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "Login/memberDeleteView";
	}
		
	// 회원 탈퇴 post
	@RequestMapping(value = "/memberdelete", method = RequestMethod.POST)
	public String memberDelete(MemberDto ddto, HttpSession session, RedirectAttributes rttr) throws Exception {

		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		MemberDto member = (MemberDto) session.getAttribute("member");
		// 세션에있는 비밀번호
		String sessionPass = member.getmPw();
		// vo로 들어오는 비밀번호
		String voPass = ddto.getmPw();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/memberDeleteView";
		} 
		service.memberdelete(ddto);
		session.invalidate();
		return "redirect:/main";
			
	}
	
	// 관리자모드 
	// 메인페이지
	@RequestMapping(value = "/mainMaster", method = RequestMethod.GET)
	public String mainMaster(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		List<SellDto> list2 = service.sellList();
		List<SellDto> list3 = service.sellOne();
		
		model.addAttribute("memberList", list);
		model.addAttribute("sellList", list2);
		model.addAttribute("sellOne", list3);
		
		return "Master/mainMaster";
	}
	
	// 판매상품 날짜조회
	@RequestMapping(value ="/sellDate", method = RequestMethod.POST)
	public String sellDate(SellDto ssdto,HttpServletRequest req) throws Exception {
		String path = "";
		HttpSession session6 = req.getSession();
		SellDto sellDate = ServiceTurtle.sellDate(ssdto);
		if (sellDate == null) {
			path = "redirect:/mainMaster";
		} else {
			session6.setAttribute("sell", sellDate);
			path = "redirect:/mainMaster";
		}
		return path;
	}
	
	// 판매현황 상세
	@RequestMapping(value = "/SalesStatus", method = RequestMethod.GET)
	public String SalesStatus(Model model) throws Exception {
		
		List<SellDto> list = service.sellList();
		List<SellDto> list2 = service.sellOne();
		
		model.addAttribute("sellList", list);
		model.addAttribute("sellOne",list2);
		
		return "Master/SalesStatus";
	}
	
	// 판매현황 판매상품 날짜별 금액조회
	@RequestMapping(value ="/sellDate2", method = RequestMethod.POST)
	public String sellDate2(SellDto ssdto,HttpServletRequest req) throws Exception {
		String path = "";
		HttpSession session6 = req.getSession();
		SellDto sellDate = ServiceTurtle.sellDate(ssdto);
		if (sellDate == null) {
			path = "redirect:/SalesStatus";
		} else {
			session6.setAttribute("sell", sellDate);
			path = "redirect:/SalesStatus";
		}
		return path;
	}
	
	// 주문요청 내역
	@RequestMapping(value = "/OrderHistory", method = RequestMethod.GET)
	public String OrderHistory(Model model,HttpServletRequest request) throws Exception {
		int totalCount = service.jumunTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		
		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 10;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		
		List<JumunDto> list = service.jumunList(map);
		
		model.addAttribute("jumunList",list);
		model.addAttribute("Paging", paging);
		
		return "Master/Manage/OrderHistory";
	}
	
	// 주문요청 결재 승인
	@RequestMapping(value="jumunState", method=RequestMethod.POST)
	public String jumunState(JumunDto juDto) throws Exception {
			
		ServiceTurtle.jumunState(juDto);
		return "redirect:/OrderHistory";
		
	}
	
	// 주문요청 배송완료 클릭시 sell DB에 데이터저장 및 jumun DB 업데이트
	@RequestMapping(value = "/sellSave", method = RequestMethod.POST)
	public String sellSave(SellDto sssdto, JumunDto juDto) throws Exception {
			
		service.sellSave(sssdto);
		ServiceTurtle.jumunState2(juDto);
		
		return "redirect:/OrderHistory";
	}
	
	// 상품관리 보기 페이지
	@RequestMapping(value = "/ProductManagement", method = RequestMethod.GET)
	public String ProductView(HttpServletRequest request, Model model) throws Exception {
				
		int totalCount = service.productTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
				
		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(8);
		paging.setTotalCount(totalCount);
				
		page = (page - 1) * 8;
				
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
				
		List<ProductDto> List = service.ProductList(map);
				
		model.addAttribute("productList", List);
		model.addAttribute("Paging", paging);
				
		return "Master/Manage/ProductManagement";
	}
	
	//상품관리 수정 페이지
	@RequestMapping(value="/mREproduct", method=RequestMethod.POST)
	public String REproduct(ProductDto pdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
			
		String path="";
		HttpSession session2 = req.getSession();
		ProductDto product2 = ServiceTurtle.product(pdto);
		if(product2 == null) {
			session2.setAttribute("product", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/main";
		} else {
			session2.setAttribute("product", product2);
			path = "redirect:/mREproduct";
		}
		return path;
	}
	
	// 상품관리 수정 페이지
	@RequestMapping(value = "/mREproduct", method = RequestMethod.GET)
	public String mREproduct(Model model) throws Exception {
		
		List<SellDto> list = service.sellList();
		
		model.addAttribute("sellList", list);
		
		return "Master/Manage/mREproduct";
	}
	
	// 상품관리 수정 페이지
	@RequestMapping(value="productUpdate", method=RequestMethod.POST)
	public String productUpdate(ProductDto pudto) throws Exception {
		
		ServiceTurtle.ProductUpdate(pudto);
		return "redirect:/ProductManagement";
		
	}
	
	// 상품관리 삭제 
	@RequestMapping(value = "/productDelete", method = RequestMethod.POST)
	public String productDelete(ProductDto pzdto) throws Exception {
		
		service.productDelete(pzdto);
		return "redirect:/ProductManagement";		
		
	}
	
	// 상품관리 추가 페이지
	@RequestMapping("/Addproduct")
	public String Addproduct() {
		return "Master/Manage/Addproduct";
	}
	
	//상품추가
	@RequestMapping(value = "addproduct", method = RequestMethod.POST)
	public String addproduct(ProductDto apdto, MultipartFile file, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		
		//파일 업로드
		String imgUploadPath = request.getSession().getServletContext().getRealPath("/resources/assets/img");
		
		String fileName = null;
		
		if(file != null) {
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes()); 
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
		}


		apdto.setpUrl(File.separator + File.separator + fileName);
		apdto.setpImg(File.separator + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		ServiceTurtle.addProduct(apdto);
		
		return "redirect:/ProductManagement";
	}
	
	// 재고관리
	@RequestMapping(value = "/InventoryManage", method = RequestMethod.GET)
	public String InventoryManage(Model model) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		List<ProductDto> list = service.productList(map);
		
		model.addAttribute("productList", list);
		
		return "Master/Manage/InventoryManage";
	}
	
	// 재고관리 수정
	@RequestMapping(value="/InventoryManage",method = RequestMethod.POST)
	public String InventoryManage(ProductDto pADto,Model model) throws Exception{
		
		service.productAdd(pADto);
		
		return "redirect:/InventoryManage";
	}
	
	// 환불요청 목록
	@RequestMapping(value = "/MRefund", method = RequestMethod.GET)
	public String MRefund(Model model,HttpServletRequest request) throws Exception {
		int totalCount = service.refundTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 10;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		
		List<RefundDto> list = service.RefundList(map);
		
		model.addAttribute("RefundList",list);
		model.addAttribute("Paging", paging);
		
		return "Master/Customer/MRefund";
	}
	
	// 관리자 환불요청 상세내용 보기 페이지
	@RequestMapping("/MDetailRefund")
	public String MDetailRefund() {
		return "Master/Customer/MDetailRefund";
	}
	
	// 관리자 환불요청 상세내용 보기 페이지(세션값주기)
	@RequestMapping(value="/MDetailRefund", method=RequestMethod.POST)
	public String MDetailRefund(RefundDto rdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
				
		String path="";
		HttpSession session2 = req.getSession();
		RefundDto refund = ServiceTurtle.refund2(rdto);
		
		if(refund == null) {
			session2.setAttribute("refund", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/main";
		} else {
			session2.setAttribute("refund", refund);
			path = "redirect:/MDetailRefund";
		}
		return path;
	}
	
	// 관리자 환불요청 신청 승락하기
	@RequestMapping(value="/RefundUpdate", method=RequestMethod.POST)
	public String RefundUpdate(RefundDto rrDto,JumunDto rjDto) throws Exception {
		
		service.RefundUpdate(rrDto);
		service.jumunRefund(rjDto);
			
		return "redirect:/MRefund";
			
	}
	
	// 관리자 고객문의 목록
	@RequestMapping(value = "/MCustomerWriteView", method = RequestMethod.GET)
	public String MCustomerWriteView(Model model,HttpServletRequest request) throws Exception {
		int totalCount = service.CBoardTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		

		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 10;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Page", page);
		map.put("PageSize", paging.getPageSize());
		List<BoardDTO> list = service.CBoardList(map);
		
		model.addAttribute("CBoardList",list);
		model.addAttribute("Paging", paging);
		
		return "Master/Customer/MCustomerWriteView";
	}
	
	// 관리자 고객문의 상세내용 보기
	@RequestMapping(value = "/ComplainView", method = RequestMethod.GET)
	public String ComplainView(Model model) throws Exception {
		
		List<BoardDTO> list = service.boardList();
		
		model.addAttribute("boardList", list);
		
		return "Master/Customer/ComplainView";
	}
	
	// 관리자 고객문의 상세내용 보기 페이지(세션값주기)
	@RequestMapping(value="/ComplainView", method=RequestMethod.POST)
	public String ComplainView(BoardDTO bdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
				
		String path="";
		HttpSession session2 = req.getSession();
		BoardDTO board = ServiceTurtle.board2(bdto);
		
		if(board == null) {
			session2.setAttribute("board", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/main";
		} else {
			session2.setAttribute("board", board);
			path = "redirect:/ComplainView";
		}
		return path;
	}
	
	// 관리자 고객문의 답변달기
	@RequestMapping(value="/boardAnswer", method=RequestMethod.POST)
	public String boardAnswer(BoardDTO bdto) throws Exception {
		
		service.boardAnswer(bdto);
		
		return "redirect:/MCustomerWriteView";
			
	}
	
	// 관리자쪽에서 고객문의 게시글 삭제하기
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public String boardDelete(BoardDTO bddto) throws Exception {

		service.boardDelete(bddto);
		return "redirect:/MCustomerWriteView";
			
	}
	
	// 회원관리 목록
	@RequestMapping(value = "/CustomerManage", method = RequestMethod.GET)
	public String CustomerManage(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		
		model.addAttribute("memberList",list);
		
		return "Master/Customer/CustomerManage";
	}
	
	// 검색결과 메소드
	@RequestMapping(value = "/MemberSearch", method = RequestMethod.POST)
	public String memberSearch(Model model, MemberDto dto, HttpServletRequest request) throws Exception {

		String key = request.getParameter("key");

		List<MemberDto> list = service.memberSearch(key);

		model.addAttribute("memberList", list);
		
		return "Master/Customer/CustomerManage";
	}
	
	//회원상세
	@RequestMapping(value = "/DetailCustomerManage", method=RequestMethod.POST)
	public String DCustomerManage(MemberDto mddto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		String path="";
		HttpSession session3 = req.getSession();
		MemberDto memberD =ServiceTurtle.memberDetail(mddto);
		if(memberD == null) {
			session3.setAttribute("member2", null);
			path = "redirect:/mainMaster";
		}else {
			session3.setAttribute("member2", memberD);
			path = "redirect:/DetailCustomerManage";
		}
		return path;
	}
	
	// 회원관리 상세보기 보기
	@RequestMapping(value = "/DetailCustomerManage", method = RequestMethod.GET)
	public String DetailCustomerManage(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		List<JumunDto> list2 = service.jumunList();
		
		model.addAttribute("memberList",list);
		model.addAttribute("jumunList", list2);
		
		return "Master/Customer/DetailCustomerManage";
	}
	
	// 회원관리 상세보기 수정
	@RequestMapping(value = "/DetailCustomerManageUpdate", method = RequestMethod.GET)
	public String DetailCustomerManageUpdate(Model model) throws Exception{
		
		List<MemberDto> list = service.memberList();
		
		model.addAttribute("memberList",list);
		
		return "Master/Customer/DetailCustomerManageUpdate";
	}
	
	// 회원관리 상세보기 수정
	@RequestMapping(value="/DetailCustomerManageUpdate", method=RequestMethod.POST)
	public String DetailCustomerManageUpdate(MemberDto mmdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
					
		String path="";
		HttpSession session2 = req.getSession();
		MemberDto member2 = ServiceTurtle.memberDetail(mmdto);
		if(member2 == null) {
			session2.setAttribute("member2", null);
			rttr.addFlashAttribute("msg", false);
			path = "redirect:/mainMaster";
		} else {
			session2.setAttribute("member2", member2);
			path = "redirect:/DetailCustomerManage";
		}
		return path;
	}
	
	// 관리자측 회원정보 수정
	@RequestMapping(value="/ManageUpdate",method = RequestMethod.POST)
	public String MyPageUpdate2(MemberDto mmdto) throws Exception{
			
		service.MemberUpdate2(mmdto);
		
		return "redirect:/CustomerManage";
	}
	
	// 관리자쪽에서 회원탈퇴시키기
	@RequestMapping(value = "/CustomerDelete", method = RequestMethod.POST)
	public String CustomerDelete(MemberDto ddto) throws Exception {

		service.memberdelete(ddto);
		return "redirect:/CustomerManage";
			
	}
}
