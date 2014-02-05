package domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LoyaltyCardManager 
{
    private List<LoyaltyCard> cards;
    

    public LoyaltyCardManager(List<LoyaltyCard> cards)
    {
        this.cards = cards;
    }
    
    public List<LoyaltyCard> getAllLoyaltyCards() 
    {
         return cards;   
    }

    
    public LoyaltyCard getLoyaltycardById(long cardId) 
    {
        for(LoyaltyCard card : cards)
        {
            if(card.getCardId() == cardId)
                return card;
        }
        return null;
    }
    
    public Map<String, List<LoyaltyCard>> getAllLoyaltyCardsByType() {
        Map<String, List<LoyaltyCard>> cardsByType = new HashMap<>();
        for (LoyaltyCard lc:cards) {
            if(!cardsByType.containsKey(lc.getType()))
                cardsByType.put(lc.getType(), new ArrayList<LoyaltyCard>());
            cardsByType.get(lc.getType()).add(lc);
        }
        return cardsByType;              
    }
    
     public long getNextCardId(long id)
    {
        LoyaltyCard oldCard = getLoyaltycardById(id);
        int index = cards.indexOf(oldCard);
        if(index == -1)
            return -1;
        
        if(index<cards.size()-1)
            return ((LoyaltyCard)cards.get(index+1)).getCardId();
        else
            return ((LoyaltyCard)cards.get(0)).getCardId();
    }

    public long getPreviousCardId(long id)
    {
        LoyaltyCard oldCard = getLoyaltycardById(id);
        int index = cards.indexOf(oldCard);
        if(index == -1)
            return -1;
        
        if(index>0)
            return ((LoyaltyCard)cards.get(index-1)).getCardId();
        else
            return ((LoyaltyCard)cards.get(cards.size()-1)).getCardId();
    }
}