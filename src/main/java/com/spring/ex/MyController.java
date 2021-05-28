package com.spring.ex;

import java.util.List;

import javax.inject.Inject;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex.dto.BasketDto;
import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.CashlistDto;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;
import com.spring.ex.dto.RefundDto;
import com.spring.ex.dto.SellDto;
import com.spring.ex.service.ServiceTurtle;
import com.spring.ex.service.TurtleService;

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
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList",list);
		
		return "Main/main";
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
		
		List<ProductDto> list = service.productList();
		
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
	
	// 헬스기구 페이지
	@RequestMapping(value = "/Health", method = RequestMethod.GET)
	public String Health(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList",list);
		
		return "Main/Health";
	}
	
	// 요가상품 페이지
	@RequestMapping(value = "/Yoga", method = RequestMethod.GET)
	public String Yoga(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList",list);
		
		return "Main/Yoga";	
	}
	
	// 운동식품 페이지
	@RequestMapping(value = "/Food", method = RequestMethod.GET)
	public String Food(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList",list);
		
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
		
		List<ProductDto> list = service.productList();
		
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
	public String basket(Model model) throws Exception {
			
		List<BasketDto> list = service.basketList();
		
		model.addAttribute("basketList", list);
		
		return "Login/basket";
	}
		
	//장바구니 추가
	@RequestMapping(value = "/basketinsert", method = RequestMethod.POST)
	public String basketInsert(BasketDto bidto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
			
		String path="";
		HttpSession session2 = req.getSession();
		ServiceTurtle.basketInsert(bidto);
		
		return "redirect:/basket";
	}
	
	// 주문조회 페이지
	@RequestMapping(value = "/JumunSearch", method = RequestMethod.GET)
	public String JumunSearch(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
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
		
		List<ProductDto> list = service.productList();
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
			
		List<ProductDto> list = service.productList();
			
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
	public String CashOk(CashlistDto cldto) throws Exception {
		
		ServiceTurtle.cashOk(cldto);
		
		return "redirect:/main";
	}
	
	// 환불조회 페이지
	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	public String refund(Model model) throws Exception {
		
		List<JumunDto> list = service.jumunList();
		
		model.addAttribute("jumunList", list);
		
		return "Cash/refund";
	}
	
	// 환불상품 상세보기 페이지
	@RequestMapping(value = "/DetailRefund", method = RequestMethod.GET)
	public String DetailRefund(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
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
	
	// 고객문의게시판
	@RequestMapping(value = "/CustomerWriteView", method = RequestMethod.GET)
	public String CustomerWriteView(Model model) throws Exception {
		
		List<BoardDTO> list = service.boardList();
		
		model.addAttribute("boardList",list);
		
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
		
		model.addAttribute("memberList", list);
		model.addAttribute("sellList", list2);
		
		return "Master/mainMaster";
	}
	
	// 판매현황 상세
	@RequestMapping(value = "/SalesStatus", method = RequestMethod.GET)
	public String SalesStatus(Model model) throws Exception {
		
		List<SellDto> list = service.sellList();
		
		model.addAttribute("sellList", list);
		
		return "Master/SalesStatus";
	}
	
	// 주문요청 내역
	@RequestMapping(value = "/OrderHistory", method = RequestMethod.GET)
	public String OrderHistory(Model model) throws Exception {
		
		List<JumunDto> list = service.jumunList();
		
		model.addAttribute("jumunList", list);
		
		return "Master/Manage/OrderHistory";
	}
	
	// 상품관리 보기 페이지
	@RequestMapping(value = "/ProductManagement", method = RequestMethod.GET)
	public String ProductManagement(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
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
	
	// 상품관리 추가 페이지
	@RequestMapping("/Addproduct")
	public String Addproduct() {
		return "Master/Manage/Addproduct";
	}
	
	//상품추가
	@RequestMapping(value = "addproduct", method = RequestMethod.POST)
	public String addproduct(ProductDto apdto, RedirectAttributes redirectAttributes) throws Exception {
		ServiceTurtle.addProduct(apdto);
		
		return "redirect:/ProductManagement";
	}
	
	// 재고관리
	@RequestMapping(value = "/InventoryManage", method = RequestMethod.GET)
	public String InventoryManage(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Master/Manage/InventoryManage";
	}
	
	// 환불요청 목록
	@RequestMapping(value = "/MRefund", method = RequestMethod.GET)
	public String MRefund(Model model) throws Exception {
		
		List<RefundDto> list = service.refundList();
		
		model.addAttribute("refundList", list);
		
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
	public String RefundUpdate(RefundDto rrDto) throws Exception {
		
		service.RefundUpdate(rrDto);
			
		return "redirect:/MRefund";
			
	}
	
	// 관리자 고객문의 목록
	@RequestMapping(value = "/MCustomerWriteView", method = RequestMethod.GET)
	public String MCustomerWriteView(Model model) throws Exception {
		
		List<BoardDTO> list = service.boardList();
		
		model.addAttribute("boardList", list);
		
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
	
	// 회원관리 목록
	@RequestMapping(value = "/CustomerManage", method = RequestMethod.GET)
	public String CustomerManage(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		
		model.addAttribute("memberList",list);
		
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
}
