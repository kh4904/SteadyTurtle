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

import com.spring.ex.dto.MemberDto;
import com.spring.ex.dto.ProductDto;
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
	        
	       path = "redirect:/LoginSuccess";
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
	@RequestMapping("/ManRanking")
	public String ManRanking() {
		return "Ranking/ManRanking";
	}
	
	// 여성랭킹 페이지
	@RequestMapping("/WomanRanking")
	public String WomanRanking() {
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
	@RequestMapping("/basket")
	public String basket() {
		return "Login/basket";
	}
	
	// 주문조회 페이지
	@RequestMapping("/JumunSearch")
	public String JumunSearch() {
		return "Login/JumunSearch";
	}
	
	// 주문상품 상세보기 페이지
	@RequestMapping("/DetailOrder")
	public String DetailOrder() {
		return "Cash/DetailOrder";
	}
	
	// 결제창 페이지
	@RequestMapping("CashOn")
	public String CashOn() {
		return "Cash/CashOn";
	}
	
	// 환불조회 페이지
	@RequestMapping("refund")
	public String refund() {
		return "Cash/refund";
	}
	
	// 환불상품 상세보기 페이지
	@RequestMapping("DetailRefund")
	public String DetailRefund() {
		return "Cash/DetailRefund";
	}
	
	// 환불요청 게시판작성 페이지
	@RequestMapping("RefundWrite")
	public String RefundWrite() {
		return "Board/RefundWrite";
	}
	
	// 고객문의게시판
	@RequestMapping("CustomerWriteView")
	public String CustomerWriteView() {
		return "Board/CustomerWriteView";
	}
	
	// 고객문의 글쓰기 페이지
	@RequestMapping("CustomerWrite")
	public String CustomerWrite() {
		return "Board/CustomerWrite";
	}
	
	// 회원정보 수정 페이지
	@RequestMapping("MyPage")
	public String MyPage() {
		return "Login/MyPage";
	}
	
	// 관리자모드 
	// 메인페이지
	@RequestMapping(value = "/mainMaster", method = RequestMethod.GET)
	public String mainMaster(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		
		model.addAttribute("memberList", list);
		
		return "Master/mainMaster";
	}
	
	// 판매현황 상세
	@RequestMapping("/SalesStatus")
	public String SalesStatus() {
		return "Master/SalesStatus";
	}
	
	// 주문요청 내역
	@RequestMapping("/OrderHistory")
	public String OrderHistory() {
		return "Master/Manage/OrderHistory";
	}
	
	// 상품관리 보기 페이지
	@RequestMapping(value = "/ProductManagement", method = RequestMethod.GET)
	public String ProductManagement(Model model) throws Exception {
		
		List<ProductDto> list = service.productList();
		
		model.addAttribute("productList", list);
		
		return "Master/Manage/ProductManagement";
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
	@RequestMapping("/InventoryManage")
	public String InventoryManage() {
		return "Master/Manage/InventoryManage";
	}
	
	// 환불요청 목록
	@RequestMapping("/MRefund")
	public String MRefund() {
		return "Master/Customer/MRefund";
	}
	
	// 환불요청 상세내용 보기
	@RequestMapping("MDetailRefund")
	public String MDetailRefund() {
		return "Master/Customer/MDetailRefund";
	}
	
	// 고객문의 목록
	@RequestMapping("MCustomerWriteView")
	public String MCustomerWriteView() {
		return "Master/Customer/MCustomerWriteView";
	}
	
	// 고객문의 상세내용 보기
	@RequestMapping("/ComplainView")
	public String ComplainView() {
		return "Master/Customer/ComplainView";
	}
	
	// 회원관리 목록
	@RequestMapping(value = "/CustomerManage", method = RequestMethod.GET)
	public String CustomerManage(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		
		model.addAttribute("memberList",list);
		
		return "Master/Customer/CustomerManage";
	}
	
	// 회원관리 상세보기 보기
	@RequestMapping(value = "/DetailCustomerManage", method = RequestMethod.GET)
	public String DetailCustomerManage(Model model) throws Exception {
		
		List<MemberDto> list = service.memberList();
		
		model.addAttribute("memberList",list);
		
		return "Master/Customer/DetailCustomerManage";
	}
}
