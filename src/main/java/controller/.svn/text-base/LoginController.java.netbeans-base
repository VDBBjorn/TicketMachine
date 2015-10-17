package controller;

import domain.Customer;
import domain.Voucher;
import domain.VoucherManager;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.CustomerDao;
import service.VoucherDao;

@Controller
public class LoginController {

    @Autowired
    private CustomerDao customerRepository;
    
    @Autowired
    private VoucherDao voucherRepository;

    private Customer customer;
    private List<Voucher> vouchersToExpire;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String goToHome(Model model, Principal principal) {
        String name = principal.getName();
        customer = customerRepository.getCustomer(Long.parseLong(name));
        VoucherManager vm = new VoucherManager(voucherRepository.getVouchers(customer));
        vouchersToExpire = vm.getVouchersToExpire();
        model.addAttribute("firstname", customer.getFirstName());
        model.addAttribute("lastname", customer.getLastName());
        model.addAttribute("vouchersToExpire", vouchersToExpire); 
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/loginfailed", method = RequestMethod.GET)
    public String loginerror(Model model) {
        model.addAttribute("error", "true");
        return "login";

    }

    @RequestMapping(value = "/logout")
    public String logout(Model model) {
        model.addAttribute("message", "You have successfully logged out.");
        return "login";

    }
    
    @RequestMapping(value = "/404")
    public String error(Model model) {
        return "404";
    }
}
