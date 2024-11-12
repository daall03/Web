package com.example.demo.controller;

public class PaymentRequest {
    private String plan;
    private int amount;
    private String itemName;
    private int quantity;
    private int taxFreeAmount;

    // Getters and Setters
    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTaxFreeAmount() {
        return taxFreeAmount;
    }

    public void setTaxFreeAmount(int taxFreeAmount) {
        this.taxFreeAmount = taxFreeAmount;
    }
}
