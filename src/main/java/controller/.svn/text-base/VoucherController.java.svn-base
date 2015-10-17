package controller;

import domain.Customer;
import domain.Voucher;
import domain.VoucherManager;
import domain.VoucherType;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.CustomerDao;
import service.VoucherDao;

/**
 *
 * @author Bjorn
 */
@Controller
public class VoucherController {

    @Autowired
    private VoucherDao voucherRepository;

    @Autowired
    private CustomerDao customerRepository;

    private Customer customer;
    private Map<VoucherType, List<Voucher>> vouchersByType;

    @RequestMapping(value = "/vouchers", method = RequestMethod.GET)
        public String getVouchers(@RequestParam(required = false) String error, @RequestParam(required = false) String ok, Model model) {
        //get user from context
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        //get vouchers from user from repository
        VoucherManager vm = new VoucherManager(voucherRepository.getVouchers(customer));
        vouchersByType = vm.getAllVouchersByType();
        //add vouchers to view
        model.addAttribute("vouchersByType", vouchersByType);
        //On redirect: add error or succes message
        if (StringUtils.isNotBlank(error)) {
            model.addAttribute("error", error);
        }
        if (StringUtils.isNotBlank(ok)) {
            model.addAttribute("ok", ok);
        }
        return "vouchers";
    }

    @RequestMapping(value = "/vouchers/{id}", method = RequestMethod.GET)
    public String getDetailVoucher(@PathVariable("id") Long id, Model model) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int customerId = Integer.parseInt(principal.getUsername());
        Voucher voucher = voucherRepository.get(id);
        //check if voucher is allocated to user, so nobody can view other people's receipts
        if ((voucher.getCustomer().getCustomerId() == customerId)) {
            model.addAttribute("voucher", voucher);
            return "voucherDetail";
        } else {
            return "404";
        }
    }

    @RequestMapping(value = "/addVoucher", method = RequestMethod.POST)
    public String addVoucher(@RequestParam String voucherId, RedirectAttributes redirectAttributes, Model model) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        Voucher voucher = voucherRepository.getVoucherByBarcode(voucherId);
        if (voucher == null) {
            redirectAttributes.addFlashAttribute("error", "error");
        } else {
            voucher.setCustomer(customer);
            voucherRepository.update(voucher);
            redirectAttributes.addFlashAttribute("ok", "added");
        }
        return "redirect:/vouchers.htm";
    }

    @RequestMapping(value = "/vouchers/previous/{id}", method = RequestMethod.GET)
    public String getPreviousVoucher(@PathVariable("id") Long id, Model model) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        VoucherManager vm = new VoucherManager(voucherRepository.getVouchers(customer));
        Long voucherId = vm.getPreviousVoucherId(id);
        String link = "redirect:/vouchers/" + voucherId + ".htm";
        return link;
    }

    @RequestMapping(value = "/vouchers/next/{id}", method = RequestMethod.GET)
    public String getNextVoucher(@PathVariable("id") Long id, Model model) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        customer = customerRepository.getCustomer(Integer.parseInt(principal.getUsername()));
        VoucherManager vm = new VoucherManager(voucherRepository.getVouchers(customer));
        Long voucherId = vm.getNextVoucherId(id);
        String link = "redirect:/vouchers/" + voucherId + ".htm";
        return link;
    }

}
