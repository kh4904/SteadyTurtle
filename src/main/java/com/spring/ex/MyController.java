package com.spring.ex;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex.dto.BasketDto;
import com.spring.ex.dto.BoardDTO;
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
	
	// 회원가입 후 메인페이지로 보내
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String joinPOST(MemberDto dto, RedirectAttributes redirectAttributes) throws Exception {

		service.register(dto);

		return "redirect:/main";
	}
	
	// 아이디, 비밀번호찾기 페이지
	@RequestMapping("/idSearch")
	public String idSearch() {
		return "Login/idSearch";
	}
	
	// 로그인시 보이는화면
	@RequestMapping("/LoginSuccess")
	public String Login() {
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
		
		List<ProductDto> list = service.productList();
			
		model.addAttribute("productList", list);
			
		return "Ranking/ManRanking";
	}
	
	// 여성랭킹 페이지
	@RequestMapping(value = "/WomanRanking", method = RequestMethod.GET)
	public String WomanRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
			
		model.addAttribute("productList", list);
			
		return "Ranking/WomanRanking";
	}
	
	// 헬스기구랭킹 페이지
	@RequestMapping(value = "/HealthRanking", method = RequestMethod.GET)
	public String HealthRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Ranking/HealthRanking";
	}
		
	// 요가상품랭킹 페이지
	@RequestMapping(value = "/YogaRanking", method = RequestMethod.GET)
	public String YogaRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Ranking/YogaRanking";
	}

	// 운동식품랭킹 페이지
	@RequestMapping(value = "/FoodRanking", method = RequestMethod.GET)
	public String FoodRanking(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Ranking/FoodRanking";
	}
	
	// 상품정보 페이지
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Cash/product";
	}
	
	// 장바구니 페이지
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String basket(Model model) throws Exception {
		
		List<BasketDto> list = service.basketList();
		
		model.addAttribute("basketList", list);
		
		return "Login/basket";
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
	
	// 결제창 페이지
	@RequestMapping("CashOn")
	public String CashOn() {
		return "Cash/CashOn";
	}
	
	// 환불조회 페이지
	@RequestMapping(value = "refund", method = RequestMethod.GET)
	public String refund(Model model) throws Exception {
		
		List<JumunDto> list = service.jumunList();
		
		model.addAttribute("jumunList", list);
		
		return "Cash/refund";
	}
	
	// 환불상품 상세보기 페이지
	@RequestMapping(value = "DetailRefund", method = RequestMethod.GET)
	public String DetailRefund(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		List<MemberDto> list2 = service.memberList();
		
		model.addAttribute("productList", list);
		model.addAttribute("memberList",list2);
		
		return "Cash/DetailRefund";
	}
	
	// 환불요청 게시판작성 페이지
	@RequestMapping("RefundWrite")
	public String RefundWrite() {
		return "Board/RefundWrite";
	}
	
	// 고객문의게시판
	@RequestMapping(value = "CustomerWriteView", method = RequestMethod.GET)
	public String CustomerWriteView(Model model) throws Exception {
		
		List<BoardDTO> list = service.boardList();
		
		model.addAttribute("boardList",list);
		
		return "Board/CustomerWriteView";
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
	@RequestMapping("MyPage")
	public String MyPage() {
		return "Login/MyPage";
	}
	
	// 회원정보 수정
	@RequestMapping(value="MyPage",method = RequestMethod.POST)
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
	@RequestMapping(value = "memberdelete", method = RequestMethod.POST)
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
	@RequestMapping("/SalesStatus")
	public String SalesStatus() {
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
	
	//상품상세보기
	@RequestMapping(value="mREproduct", method=RequestMethod.POST)
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
	@RequestMapping("/mREproduct")
	public String mREproduct() {
		return "Master/Manage/mREproduct";
	}
	
	// 상품관리 추가 페이지
	@RequestMapping("/Addproduct")
	public String Addproduct() {
		return "Master/Manage/Addproduct";
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
	
	// 환불요청 상세내용 보기
	@RequestMapping("MDetailRefund")
	public String MDetailRefund() {
		return "Master/Customer/MDetailRefund";
	}
	
	// 고객문의 목록
	@RequestMapping(value = "MCustomerWriteView", method = RequestMethod.GET)
	public String MCustomerWriteView(Model model) throws Exception {
		
		List<BoardDTO> list = service.boardList();
		
		model.addAttribute("boardList", list);
		
		return "Master/Customer/MCustomerWriteView";
	}
	
	// 고객문의 상세내용 보기
	@RequestMapping(value = "/ComplainView", method = RequestMethod.GET)
	public String ComplainView(Model model) throws Exception {
		
		List<BoardDTO> list = service.boardList();
		
		model.addAttribute("boardList", list);
		
		return "Master/Customer/ComplainView";
	}
	
	// 회원관리 목록
	@RequestMapping(value = "/CustomerManage", method = RequestMethod.GET)
	public String CustomerManage(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		
		model.addAttribute("memberList",list);
		
		return "Master/Customer/CustomerManage";
	}
	
	//회원상세
	@RequestMapping(value = "DetailCustomerManage", method=RequestMethod.POST)
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
		
		model.addAttribute("memberList",list);
		
		return "Master/Customer/DetailCustomerManage";
	}
}
