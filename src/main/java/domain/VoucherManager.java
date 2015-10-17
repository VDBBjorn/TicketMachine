package domain;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VoucherManager {
    
    private List<Voucher> vouchers;
    private final static int DAYSBEFOREEXPIRE=5;
    
    public VoucherManager(List<Voucher> vouchers) {
        this.vouchers = vouchers;
    }

    public List<Voucher> getAllVouchers() {
        return vouchers;
    }

    public Voucher getVoucherById(long voucherId) {
        for(Voucher v : vouchers){
            if(v.getVoucherId()==voucherId)
                return v;
        }
        return null;
    }

    public List<Voucher> getVouchersByType(VoucherType type) {
        List<Voucher> vl = new ArrayList<>();
        for(Voucher v: vouchers) {
            if(v.getVoucherType()==type)
                vl.add(v);
        }
        return vl;
    }
    
    public Map<VoucherType, List<Voucher>> getAllVouchersByType() {
        Map<VoucherType, List<Voucher>> vouchersByType = new HashMap<>();
        for (VoucherType type : VoucherType.values()) {
            vouchersByType.put(type, getVouchersByType(type)); 
        }
        return vouchersByType;              
    }

    public void addVoucher(int barcode) {
        throw new UnsupportedOperationException();
    }

    public long getPreviousVoucherId(Long id) {
        Voucher huidigVoucher=getVoucherById(id); 
        int index=vouchers.indexOf(huidigVoucher);
        if(index==0){
            int i=vouchers.size()-1; 
            return vouchers.get(i).getVoucherId();
        }
        int i=index-1; 
        return vouchers.get(i).getVoucherId();     
    }

    public long getNextVoucherId(Long id) {
        Voucher huidigVoucher=getVoucherById(id); 
        int index=vouchers.indexOf(huidigVoucher);
        int i=index+1;
        if(i==vouchers.size())
            return vouchers.get(0).getVoucherId();
        return vouchers.get(i).getVoucherId();        
    }

    public List<Voucher> getVouchersToExpire() {
        List<Voucher> vouchersToExpire=new ArrayList<>();
        for(Voucher v:vouchers){
            if(v.getDaysToExpire()<=DAYSBEFOREEXPIRE)
                vouchersToExpire.add(v);
        }
        return vouchersToExpire;
    }

}
