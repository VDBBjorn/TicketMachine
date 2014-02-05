package domain;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

public class ReceiptManager {

    private List<Receipt> receipts;
    private HashMap<Category, List<ProductLine>> productLinesByCategory;

    public ReceiptManager(List<Receipt> receipts) {
        this.receipts = receipts;
        sortReceipts();
    }

    private Receipt getReceiptById(Long ticketId) {
        for (Receipt r : receipts) {
            if (r.getTicketId() == ticketId) {
                return r;
            }
        }
        return null;
    }

    public List<Receipt> getAllReceipts() {
        sortReceipts();
        return this.receipts;
    }

    public List<Receipt> getLastReceipts(int number) {
        List<Receipt> lastReceipts;
        sortReceipts();
        if (receipts.size() > number) {
            lastReceipts = receipts.subList(0, number);
        } else {
            lastReceipts = receipts;
        }
        return lastReceipts;

    }

    public HashMap<Category, List<ProductLine>> getExpenseReport(String period, String storeName) {
        productLinesByCategory = new HashMap<>();
        GregorianCalendar receiptsFrom = this.getDateLastReceipts(period);
        String storeNameHelper;
        for (Receipt r : receipts) {
            //mss niet de beste oplossing...
            if (storeName.equals("all")) {
                storeNameHelper = r.getStore().getName();
            } else {
                storeNameHelper = storeName;
            }
            if (r.getDateCalendar().after(receiptsFrom) && r.getStore().getName().equals(storeNameHelper)) {
                for (ProductLine pl : r.getProductLines()) {
                    Category c = pl.getProduct().getCategory();
                    if (!productLinesByCategory.containsKey(c)) {
                        productLinesByCategory.put(c, new ArrayList<ProductLine>());
                    }
                    productLinesByCategory.get(c).add(pl);
                }
            }
        }
        return productLinesByCategory;
    }

    public HashMap<Category, Double> getCostPerCategory() {
        HashMap<Category, Double> costPerCategory = new HashMap<>();
        for (Map.Entry<Category, List<ProductLine>> entrey : productLinesByCategory.entrySet()) {
            double cost = 0;
            for (ProductLine pl : entrey.getValue()) {
                cost += pl.getTotalPrice();
            }
            costPerCategory.put(entrey.getKey(), new BigDecimal(cost).setScale(2, RoundingMode.HALF_UP).doubleValue());
        }
        return costPerCategory;
    }

    public HashMap<Category, Double> getCaloriesPerCategory(String timespan) {
        HashMap<Category, Double> caloriesPerCategory = new HashMap<>();
        for (Map.Entry<Category, List<ProductLine>> entrey : productLinesByCategory.entrySet()) {
            double calories = 0;
            for (ProductLine pl : entrey.getValue()) {
                calories += pl.getCalories();
            }
            switch (timespan) {
                case "year":
                    calories = calories / getTotalCalories("year") * 100;
                    break;
                case "month":
                    calories = calories / getTotalCalories("month") * 100;
                    break;
                case "week":
                    calories = calories / getTotalCalories("week") * 100;
                    break;
            }
            caloriesPerCategory.put(entrey.getKey(), new BigDecimal(calories).setScale(2, RoundingMode.HALF_UP).doubleValue());
        }
        return caloriesPerCategory;
    }

    public HashMap<Category, Double> getProteinsPerCategory(String timespan) {
        HashMap<Category, Double> proteinsPerCategory = new HashMap<>();
        for (Map.Entry<Category, List<ProductLine>> entrey : productLinesByCategory.entrySet()) {
            double proteins = 0;
            for (ProductLine pl : entrey.getValue()) {
                proteins += pl.getProteins();
            }
            switch (timespan) {
                case "year":
                    proteins = proteins / getTotalProteins("year") * 100;
                    break;
                case "month":
                    proteins = proteins / getTotalProteins("month") * 100;
                    break;
                case "week":
                    proteins = proteins / getTotalProteins("week") * 100;
                    break;
            }
            proteinsPerCategory.put(entrey.getKey(), new BigDecimal(proteins).setScale(2, RoundingMode.HALF_UP).doubleValue());
        }
        return proteinsPerCategory;
    }
    
    

    public HashMap<Category, Double> getcarbohydratesPerCategory(String timespan) {
        HashMap<Category, Double> carbohydratesPerCategory = new HashMap<>();
        for (Map.Entry<Category, List<ProductLine>> entrey : productLinesByCategory.entrySet()) {
            double carbohydrates = 0;
            for (ProductLine pl : entrey.getValue()) {
                carbohydrates += pl.getCarbohydrates();
            }
            switch (timespan) {
                case "year":
                    carbohydrates = carbohydrates / getTotalCarbohydrates("year") * 100;
                    break;
                case "month":
                    carbohydrates = carbohydrates / getTotalCarbohydrates("month") * 100;
                    break;
                case "week":
                    carbohydrates = carbohydrates / getTotalCarbohydrates("week") * 100;
                    break;
            }
            if(carbohydrates>0)
                carbohydratesPerCategory.put(entrey.getKey(), new BigDecimal(carbohydrates).setScale(2, RoundingMode.HALF_UP).doubleValue());
            else
                carbohydratesPerCategory.put(entrey.getKey(), 0.00);
        }
        return carbohydratesPerCategory;
    }

    public HashMap<Category, Double> getfatPerCategory(String timespan) {
        HashMap<Category, Double> fatPerCategory = new HashMap<>();
        for (Map.Entry<Category, List<ProductLine>> entrey : productLinesByCategory.entrySet()) {
            double fat = 0;
            for (ProductLine pl : entrey.getValue()) {
                fat += pl.getFats();
            }
            switch (timespan) {
                case "year":
                    fat = fat / getTotalFat("year") * 100;
                    break;
                case "month":
                    fat = fat / getTotalFat("month") * 100;
                    break;
                case "week":
                    fat = fat / getTotalFat("week") * 100;
                    break;
            }
            fatPerCategory.put(entrey.getKey(), new BigDecimal(fat).setScale(2, RoundingMode.HALF_UP).doubleValue());
        }
        return fatPerCategory;
    }

    public Set<Store> getStores() {
        Set<Store> stores = new HashSet<>();
        for (Receipt r : receipts) {
            stores.add(r.getStore());
        }
        Set<Store> sortedStores = new TreeSet<>(new Comparator<Store>() {
            @Override
            public int compare(Store s1, Store s2) {
                return s2.getName().compareTo(s1.getName());
            }
        });
        sortedStores.addAll(stores);
        return sortedStores;
    }

    private GregorianCalendar getDateLastReceipts(String period) {
        GregorianCalendar date = new GregorianCalendar();
        switch (period) {
            case "week":
                date.add((GregorianCalendar.DATE), -7);
                break;
            case "month":
                date.add((GregorianCalendar.MONTH), -1);
                break;
            case "year":
                date.add((GregorianCalendar.YEAR), -1);
                break;
        }
        return date;
    }

    public Long getPreviousReceiptId(Long id) {
        Receipt huidigReceipt = getReceiptById(id);
        int index = receipts.indexOf(huidigReceipt);
        if (index == 0) {
            int i = receipts.size() - 1;
            return receipts.get(i).getTicketId();
        }
        int i = index - 1;
        return receipts.get(i).getTicketId();
    }

    public Long getNextReceiptId(Long id) {
        Receipt huidigReceipt = getReceiptById(id);
        int index = receipts.indexOf(huidigReceipt);
        int i = index + 1;
        if (i == receipts.size()) {
            return receipts.get(0).getTicketId();
        }
        return receipts.get(i).getTicketId();
    }

    public final void sortReceipts() {
        Collections.sort(this.receipts, new Comparator<Receipt>() {

            @Override
            public int compare(Receipt r1, Receipt r2) {
                GregorianCalendar date1 = r1.getDateCalendar();
                GregorianCalendar date2 = r2.getDateCalendar();

                return date2.compareTo(date1);
            }

        });
    }

    private double getTotalCalories(String timespan) {
        double calories = 0;
        GregorianCalendar date = getDateLastReceipts(timespan);
        List<Receipt> lastReceipts = new ArrayList<>();
        for(Receipt r : receipts) {
            if(r.getRealDate().after(date))
                lastReceipts.add(r);
        }
        for (Receipt receipt : lastReceipts) {
            for (ProductLine line : receipt.getProductLines()) {
                calories += line.getCalories();
            }
        }
        return calories;
    }
    
    private double getTotalProteins(String timespan) {
        double proteins = 0;
        GregorianCalendar date = getDateLastReceipts(timespan);
        List<Receipt> lastReceipts = new ArrayList<>();
        for(Receipt r : receipts) {
            if(r.getRealDate().after(date))
                lastReceipts.add(r);
        }
        for (Receipt receipt : lastReceipts) {
            for (ProductLine line : receipt.getProductLines()) {
                proteins += line.getProteins();
            }
        }
        return proteins;
    }

    private double getTotalCarbohydrates(String timespan) {
        double carbohydrates = 0;
        GregorianCalendar date = getDateLastReceipts(timespan);
        List<Receipt> lastReceipts = new ArrayList<>();
        for(Receipt r : receipts) {
            if(r.getRealDate().after(date))
                lastReceipts.add(r);
        }
        for (Receipt receipt : lastReceipts) {
            for (ProductLine line : receipt.getProductLines()) {
                carbohydrates += line.getCarbohydrates();
            }
        }
        return carbohydrates;
    }

    private double getTotalFat(String timespan) {
        double fat = 0;
        GregorianCalendar date = getDateLastReceipts(timespan);
        List<Receipt> lastReceipts = new ArrayList<>();
        for(Receipt r : receipts) {
            if(r.getRealDate().after(date))
                lastReceipts.add(r);
        }
        for (Receipt receipt : lastReceipts) {
            for (ProductLine line : receipt.getProductLines()) {
                fat += line.getFats();
            }
        }
        return fat;
    }

}
