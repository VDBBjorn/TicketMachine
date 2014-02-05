package service;

import domain.Customer;
import domain.Voucher;
import java.util.List;

/**
 *
 * @author Bjorn
 */
public interface VoucherDao extends GenericDao<Voucher>{
    
    public List<Voucher> getVouchers(Customer customer);

    public Voucher getVoucherByBarcode(String barcode);
    
}
