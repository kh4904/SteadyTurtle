package com.spring.ex;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex.dto.BoardDTO;
import com.spring.ex.dto.CartListVO;
import com.spring.ex.dto.CartVO;
import com.spring.ex.dto.CashlistDto;
import com.spring.ex.dto.JumunDto;
import com.spring.ex.dto.MemberDto;
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
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	// 濡쒓렇�씤�떆 �븘�슂
	@Autowired
	private ServiceTurtle ServiceTurtle;

	// 硫붿씤�럹�씠吏�
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList",list);
		
		return "Main/main";
	}
	
	// �쉶�썝媛��엯 �럹�씠吏�
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() throws Exception {
		return "Login/join";
	}
	
	//�븘�씠�뵒 以묐났泥댄겕
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	@ResponseBody
	public int idChk(MemberDto mdto) throws Exception {
		int result = ServiceTurtle.idChk(mdto);
		return result;
	}
	
	// �쉶�썝媛��엯 �썑 硫붿씤�럹�씠吏�濡� 蹂대궡
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String joinPOST(MemberDto dto) throws Exception {
		int result = service.idChk(dto);
		try {
			if(result == 1) {
				return "Login/join";
			}else if(result == 0) {
				
			}
			// �슂湲곗뿉�꽌~ �엯�젰�맂 �븘�씠�뵒媛� 議댁옱�븳�떎硫� -> �떎�떆 �쉶�썝媛��엯 �럹�씠吏�濡� �룎�븘媛�湲� 
			// 議댁옱�븯吏� �븡�뒗�떎硫� -> register
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		service.register(dto);
		return "redirect:/main";
	}
	
	// 濡쒓렇�씤�떆 蹂댁씠�뒗�솕硫�
	@RequestMapping(value = "/LoginSuccess", method = RequestMethod.GET)
	public String Login(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Login/LoginSuccess";
	}
	
	// 濡쒓렇�씤�떆 蹂댁씠�뒗�솕硫�
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
	
	//濡쒓렇�븘�썐
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpSession session, RedirectAttributes rttr) throws Exception {
		session.invalidate();
		rttr.addFlashAttribute("msg2",false);
		return "redirect:/main";
	}
	
	// �븘�씠�뵒, 鍮꾨�踰덊샇李얘린 �럹�씠吏�
	@RequestMapping(value = "/idSearch", method = RequestMethod.GET)
	public String idSearch() throws Exception {
		return "Login/idSearch";
	}
	
	// �븘�씠�뵒 李얘린 
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
		
	// 鍮꾨�踰덊샇 李얘린 
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
	
	// �뿬�뒪湲곌뎄 �럹�씠吏�
	@RequestMapping(value = "/Health", method = RequestMethod.GET)
	public String Health(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList",list);
		
		return "Main/Health";
	}
	
	// �슂媛��긽�뭹 �럹�씠吏�
	@RequestMapping(value = "/Yoga", method = RequestMethod.GET)
	public String Yoga(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList",list);
		
		return "Main/Yoga";	
	}
	
	// �슫�룞�떇�뭹 �럹�씠吏�
	@RequestMapping(value = "/Food", method = RequestMethod.GET)
	public String Food(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList",list);
		
		return "Main/Food";
	}
	
	// �궓�꽦�옲�궧 �럹�씠吏�
	@RequestMapping(value = "/ManRanking", method = RequestMethod.GET)
	public String ManRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.manRanking();
			
		model.addAttribute("manRanking", list);
			
		return "Ranking/ManRanking";
	}
	
	// �뿬�꽦�옲�궧 �럹�씠吏�
	@RequestMapping(value = "/WomanRanking", method = RequestMethod.GET)
	public String WomanRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.womanRanking();
			
		model.addAttribute("womanRanking", list);
			
		return "Ranking/WomanRanking";
	}
	
	// �뿬�뒪湲곌뎄�옲�궧 �럹�씠吏�
	@RequestMapping(value = "/HealthRanking", method = RequestMethod.GET)
	public String HealthRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.healthRanking();
		
		model.addAttribute("healthRanking", list);
		
		return "Ranking/HealthRanking";
	}
		
	// �슂媛��긽�뭹�옲�궧 �럹�씠吏�
	@RequestMapping(value = "/YogaRanking", method = RequestMethod.GET)
	public String YogaRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.yogaRanking();
		
		model.addAttribute("yogaRanking", list);
		
		return "Ranking/YogaRanking";
	}

	// �슫�룞�떇�뭹�옲�궧 �럹�씠吏�
	@RequestMapping(value = "/FoodRanking", method = RequestMethod.GET)
	public String FoodRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.foodRanking();
		
		model.addAttribute("foodRanking", list);
		
		return "Ranking/FoodRanking";
	}
	
	// �긽�뭹�젙蹂� �긽�꽭蹂닿린 �럹�씠吏�
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Cash/product";
	}
	
	// �긽�뭹�젙蹂� �긽�꽭蹂닿린 �럹�씠吏�
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
	
	// �옣諛붽뎄�땲 �럹�씠吏�
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String basket(HttpSession session, Model model) throws Exception {
		 
		MemberDto member = (MemberDto)session.getAttribute("member");
		String mId = member.getmId();
		
		List<CartListVO> cartList = service.cartList(mId);
		
		model.addAttribute("cartList", cartList);
		
		return "Login/basket";
	}
	
	// 移댄듃 �떞湲�
	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {
		 
		int result = 0;
		 
		MemberDto member = (MemberDto)session.getAttribute("member");
		ProductDto product = (ProductDto)session.getAttribute("product");
		 if(member != null) {
		 	cart.setmId(member.getmId());
		 	cart.setpNum(product.getpNum());
		 	service.addCart5(cart);
		 	result = 1;
		 }
		return result;
	}
	
	// 二쇰Ц議고쉶 �럹�씠吏�
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
	
	// 二쇰Ц�긽�뭹 �긽�꽭蹂닿린 �럹�씠吏�
	@RequestMapping(value = "/DetailOrder", method = RequestMethod.GET)
	public String DetailOrder(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		List<MemberDto> list2 = service.memberList();
		
		model.addAttribute("productList", list);
		model.addAttribute("memberList", list2);
		
		return "Cash/DetailOrder";
	}
	
	// 二쇰Ц�긽�뭹 �긽�꽭蹂닿린 �럹�씠吏�
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

	// 寃곗젣李� �럹�씠吏�
	@RequestMapping(value = "/CashOn", method = RequestMethod.GET)
	public String CashOn(Model model) throws Exception {
			
		List<ProductDto> list = service.productList();
			
		model.addAttribute("productList", list);
			
		return "Cash/CashOn";
	}
	// 諛붾줈寃곗젣
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
			
	//寃곗젣�븯湲�
	@RequestMapping(value = "CashOk", method = RequestMethod.POST)
	public String CashOk(CashlistDto cldto) throws Exception {
		
		ServiceTurtle.cashOk(cldto);
		
		return "redirect:/main";
	}
	
	// �솚遺덉“�쉶 �럹�씠吏�
	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	public String refund(Model model) throws Exception {
		
		List<JumunDto> list = service.jumunList();
		
		model.addAttribute("jumunList", list);
		
		return "Cash/refund";
	}
	
	// �솚遺덉긽�뭹 �긽�꽭蹂닿린 �럹�씠吏�
	@RequestMapping(value = "/DetailRefund", method = RequestMethod.GET)
	public String DetailRefund(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		List<MemberDto> list2 = service.memberList();
		
		model.addAttribute("productList", list);
		model.addAttribute("memberList",list2);
		
		return "Cash/DetailRefund";
	}
	
	// �솚遺덉긽�뭹 �긽�꽭蹂닿린 �꽭�뀡�쑀吏� �럹�씠吏�
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
	
	// �솚遺덉슂泥� 寃뚯떆�뙋�옉�꽦 �럹�씠吏�
	@RequestMapping("/RefundWrite")
	public String RefundWrite() {
		return "Board/RefundWrite";
	}
	
	// �솚遺덉슂泥� 寃뚯떆�뙋�옉�꽦 �럹�씠吏�(�꽭�뀡媛믪＜湲�)
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
	
	// �솚遺덉슂泥� �솚遺덉떊泥� 湲��벖�썑 DB蹂대궡湲�
	@RequestMapping(value = "/refundwrite", method = RequestMethod.POST)
	public String refundwrite(RefundDto rwDto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.refundWrite(rwDto);
		
		return "redirect:/refund";
	}
	
	// 怨좉컼臾몄쓽寃뚯떆�뙋
	@RequestMapping(value = "/CustomerWriteView", method = RequestMethod.GET)
	public String CustomerWriteView(Model model) throws Exception {
		
		List<BoardDTO> list = service.boardList();
		
		model.addAttribute("boardList",list);
		
		return "Board/CustomerWriteView";
	}
	
	// 怨좉컼臾몄쓽 寃뚯떆�뙋 湲�蹂닿린
	@RequestMapping("/CustomerWriteAnswer")
	public String CutomerWriteAnswer(){
		
		return "Board/CustomerWriteAnswer";
		
	}
	
	// 怨좉컼臾몄쓽 寃뚯떆�뙋 湲�蹂닿린(�꽭�뀡媛믪＜湲�)
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
	
	// 怨좉컼臾몄쓽 寃뚯떆湲� �궘�젣�븯湲�(湲��벖 �옣蹂몄씤�씠硫� 媛��뒫)
	@RequestMapping(value = "/boardDelete2", method = RequestMethod.POST)
	public String boardDelete2(BoardDTO bddto) throws Exception {

		service.boardDelete(bddto);
		return "redirect:/CustomerWriteView";
			
	}
	
	// 怨좉컼臾몄쓽 湲��벐湲� �럹�씠吏�
	@RequestMapping(value = "/CustomerWrite", method = RequestMethod.GET)
	public String CustomerWrite() throws Exception {
		return "Board/CustomerWrite";
	}
	
	// 怨좉컼臾몄쓽 湲��벐湲� �썑 怨좉컼寃뚯떆�뙋�럹�씠吏�濡� 蹂대궡
	@RequestMapping(value = "/writeAction", method = RequestMethod.POST)
	public String boardPOST(BoardDTO bdto, RedirectAttributes redirectAttributes) throws Exception {

		service.boardWrite(bdto);

		return "redirect:/CustomerWriteView";
	}
	
	// �쉶�썝�젙蹂� �닔�젙 �럹�씠吏�
	@RequestMapping("/MyPage")
	public String MyPage() {
		return "Login/MyPage";
	}
	
	// �쉶�썝�젙蹂� �닔�젙
	@RequestMapping(value="/MyPage",method = RequestMethod.POST)
	public String MyPageUpdate(MemberDto mDto,HttpSession session) throws Exception{
		
		service.MemberUpdate(mDto);

		session.invalidate(); 
		
		return "redirect:/MyPage";
	}
	
	// �쉶�썝 �깉�눜 get
	@RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "Login/memberDeleteView";
	}
		
	// �쉶�썝 �깉�눜 post
	@RequestMapping(value = "/memberdelete", method = RequestMethod.POST)
	public String memberDelete(MemberDto ddto, HttpSession session, RedirectAttributes rttr) throws Exception {

		// �꽭�뀡�뿉 �엳�뒗 member瑜� 媛��졇�� member蹂��닔�뿉 �꽔�뼱以띾땲�떎.
		MemberDto member = (MemberDto) session.getAttribute("member");
		// �꽭�뀡�뿉�엳�뒗 鍮꾨�踰덊샇
		String sessionPass = member.getmPw();
		// vo濡� �뱾�뼱�삤�뒗 鍮꾨�踰덊샇
		String voPass = ddto.getmPw();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/memberDeleteView";
		} 
		service.memberdelete(ddto);
		session.invalidate();
		return "redirect:/main";
			
	}
	
	// 愿�由ъ옄紐⑤뱶 
	// 硫붿씤�럹�씠吏�
	@RequestMapping(value = "/mainMaster", method = RequestMethod.GET)
	public String mainMaster(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		List<SellDto> list2 = service.sellList();
		
		model.addAttribute("memberList", list);
		model.addAttribute("sellList", list2);
		
		return "Master/mainMaster";
	}
	
	// �뙋留ㅽ쁽�솴 �긽�꽭
	@RequestMapping(value = "/SalesStatus", method = RequestMethod.GET)
	public String SalesStatus(Model model) throws Exception {
		
		List<SellDto> list = service.sellList();
		
		model.addAttribute("sellList", list);
		
		return "Master/SalesStatus";
	}
	
	// 二쇰Ц�슂泥� �궡�뿭
	@RequestMapping(value = "/OrderHistory", method = RequestMethod.GET)
	public String OrderHistory(Model model) throws Exception {
		
		List<JumunDto> list = service.jumunList();
		
		model.addAttribute("jumunList", list);
		
		return "Master/Manage/OrderHistory";
	}
	
	// �긽�뭹愿�由� 蹂닿린 �럹�씠吏�
	@RequestMapping(value = "/ProductManagement", method = RequestMethod.GET)
	public String ProductManagement(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Master/Manage/ProductManagement";
	}
	
	//�긽�뭹愿�由� �닔�젙 �럹�씠吏�
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
	
	// �긽�뭹愿�由� �닔�젙 �럹�씠吏�
	@RequestMapping(value = "/mREproduct", method = RequestMethod.GET)
	public String mREproduct(Model model) throws Exception {
		
		List<SellDto> list = service.sellList();
		
		model.addAttribute("sellList", list);
		
		return "Master/Manage/mREproduct";
	}
	
	// �긽�뭹愿�由� �닔�젙 �럹�씠吏�
	@RequestMapping(value="productUpdate", method=RequestMethod.POST)
	public String productUpdate(ProductDto pudto) throws Exception {
		
		ServiceTurtle.ProductUpdate(pudto);
		return "redirect:/ProductManagement";
		
	}
	
	// �긽�뭹愿�由� 異붽� �럹�씠吏�
	@RequestMapping("/Addproduct")
	public String Addproduct() {
		return "Master/Manage/Addproduct";
	}
	
	//�긽�뭹異붽�
	@RequestMapping(value = "addproduct", method = RequestMethod.POST)
	public String addproduct(ProductDto apdto, MultipartFile file, RedirectAttributes redirectAttributes) throws Exception {
		
		//�뙆�씪 �뾽濡쒕뱶
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}


		apdto.setpUrl(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		apdto.setpImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		ServiceTurtle.addProduct(apdto);
		
		return "redirect:/ProductManagement";
	}
	
	// �옱怨좉�由�
	@RequestMapping(value = "/InventoryManage", method = RequestMethod.GET)
	public String InventoryManage(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Master/Manage/InventoryManage";
	}
	
	// �옱怨좉�由� �닔�젙
	@RequestMapping(value="/InventoryManage",method = RequestMethod.POST)
	public String InventoryManage(ProductDto pADto,Model model) throws Exception{
		
		service.productAdd(pADto);
		
		return "redirect:/InventoryManage";
	}
	
	// �솚遺덉슂泥� 紐⑸줉
	@RequestMapping(value = "/MRefund", method = RequestMethod.GET)
	public String MRefund(Model model) throws Exception {
		
		List<RefundDto> list = service.refundList();
		
		model.addAttribute("refundList", list);
		
		return "Master/Customer/MRefund";
	}
	
	// 愿�由ъ옄 �솚遺덉슂泥� �긽�꽭�궡�슜 蹂닿린 �럹�씠吏�
	@RequestMapping("/MDetailRefund")
	public String MDetailRefund() {
		return "Master/Customer/MDetailRefund";
	}
	
	// 愿�由ъ옄 �솚遺덉슂泥� �긽�꽭�궡�슜 蹂닿린 �럹�씠吏�(�꽭�뀡媛믪＜湲�)
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
	
	// 愿�由ъ옄 �솚遺덉슂泥� �떊泥� �듅�씫�븯湲�
	@RequestMapping(value="/RefundUpdate", method=RequestMethod.POST)
	public String RefundUpdate(RefundDto rrDto) throws Exception {
		
		service.RefundUpdate(rrDto);
			
		return "redirect:/MRefund";
			
	}
	
	// 愿�由ъ옄 怨좉컼臾몄쓽 紐⑸줉
	@RequestMapping(value = "/MCustomerWriteView", method = RequestMethod.GET)
	public String MCustomerWriteView(Model model) throws Exception {
		
		List<BoardDTO> list = service.boardList();
		
		model.addAttribute("boardList", list);
		
		return "Master/Customer/MCustomerWriteView";
	}
	
	// 愿�由ъ옄 怨좉컼臾몄쓽 �긽�꽭�궡�슜 蹂닿린
	@RequestMapping(value = "/ComplainView", method = RequestMethod.GET)
	public String ComplainView(Model model) throws Exception {
		
		List<BoardDTO> list = service.boardList();
		
		model.addAttribute("boardList", list);
		
		return "Master/Customer/ComplainView";
	}
	
	// 愿�由ъ옄 怨좉컼臾몄쓽 �긽�꽭�궡�슜 蹂닿린 �럹�씠吏�(�꽭�뀡媛믪＜湲�)
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
	
	// 愿�由ъ옄 怨좉컼臾몄쓽 �떟蹂��떖湲�
	@RequestMapping(value="/boardAnswer", method=RequestMethod.POST)
	public String boardAnswer(BoardDTO bdto) throws Exception {
		
		service.boardAnswer(bdto);
		
		return "redirect:/MCustomerWriteView";
			
	}
	
	// 愿�由ъ옄履쎌뿉�꽌 怨좉컼臾몄쓽 寃뚯떆湲� �궘�젣�븯湲�
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public String boardDelete(BoardDTO bddto) throws Exception {

		service.boardDelete(bddto);
		return "redirect:/MCustomerWriteView";
			
	}
	
	// �쉶�썝愿�由� 紐⑸줉
	@RequestMapping(value = "/CustomerManage", method = RequestMethod.GET)
	public String CustomerManage(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		
		model.addAttribute("memberList",list);
		
		return "Master/Customer/CustomerManage";
	}
	
	//�쉶�썝�긽�꽭
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
	
	// �쉶�썝愿�由� �긽�꽭蹂닿린 蹂닿린
	@RequestMapping(value = "/DetailCustomerManage", method = RequestMethod.GET)
	public String DetailCustomerManage(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		List<JumunDto> list2 = service.jumunList();
		
		model.addAttribute("memberList",list);
		model.addAttribute("jumunList", list2);
		
		return "Master/Customer/DetailCustomerManage";
	}
	
	// 愿�由ъ옄履쎌뿉�꽌 �쉶�썝�깉�눜�떆�궎湲�
	@RequestMapping(value = "/CustomerDelete", method = RequestMethod.POST)
	public String CustomerDelete(MemberDto ddto) throws Exception {

		service.memberdelete(ddto);
		return "redirect:/CustomerManage";
			
	}
}
