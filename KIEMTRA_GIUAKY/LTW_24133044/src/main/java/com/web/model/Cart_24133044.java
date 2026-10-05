package com.web.model;

import java.util.ArrayList;
import java.util.List;

public class Cart_24133044 {
    private List<CartItem_24133044> items;

    public Cart_24133044() {
        items = new ArrayList<>();
    }

    public List<CartItem_24133044> getItems() {
        return items;
    }

    public void addItem(CartItem_24133044 item) {
        for (CartItem_24133044 i : items) {
            if (i.getBook().getBookid() == item.getBook().getBookid()) {
                i.setQuantity(i.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(int bookId) {
        items.removeIf(i -> i.getBook().getBookid() == bookId);
    }

    public void updateQuantity(int bookId, int quantity) {
        for (CartItem_24133044 i : items) {
            if (i.getBook().getBookid() == bookId) {
                i.setQuantity(quantity);
                return;
            }
        }
    }

    public double getTotalAmount() {
        double total = 0;
        for (CartItem_24133044 item : items) {
            total += item.getTotalPrice();
        }
        return total;
    }
}

