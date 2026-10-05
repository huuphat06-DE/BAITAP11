package com.web.model;

public class CartItem_24133044 {
    private Book_24133044 book;
    private int quantity;

    public CartItem_24133044() {}

    public CartItem_24133044(Book_24133044 book, int quantity) {
        this.book = book;
        this.quantity = quantity;
    }

    public Book_24133044 getBook() {
        return book;
    }

    public void setBook(Book_24133044 book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return book.getPrice() * quantity;
    }
}

