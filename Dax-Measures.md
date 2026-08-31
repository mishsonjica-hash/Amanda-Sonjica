DAX Formulars used
------------------

- Number of customers in each tier as 

```dax
Tier Count = COUNT('customers (1)'[loyalty_tier])
```

```dax
Total Customers = COUNT('customers (1)'[customer_id])
```

```dax
April Promo Revenue = 
    CALCULATE(
        [Total Revenue],
        YEAR(Transactions[transaction_date]) = 2025,
        imbewu_products[sub_category] = "Maize Meal",
        Stores[province] = "Western Cape"
    )
```

Averages:

```dax
    Average Transaction Value = [Total Revenue]/transaction_items[Transaction count]
```

```dax
    Avg Non-April Monthly Revenue = 
    CALCULATE(
        DIVIDE([Total Revenue], DISTINCTCOUNT(transactions[Month])),
        YEAR(Transactions[transaction_date]) = 2025,
        MONTH(Transactions[transaction_date]) <> 4,
        imbewu_products[sub_category] = "Maize Meal",
        Stores[province] = "Western Cape"
    )

    Avg Transaction Value 2024 = 
    DIVIDE(
        [Revenue 2024],
        [Transactions 2024],
        0
    )
```

```dax
Avg Transaction Value 2025 = 
    DIVIDE(
        [Revenue 2025],
        [Transactions 2025],
        0
    )
```

    Avg Non-April Monthly Revenue = 
    CALCULATE(
        DIVIDE([Total Revenue], DISTINCTCOUNT(transactions[Month])),
        YEAR(Transactions[transaction_date]) = 2025,
        MONTH(Transactions[transaction_date]) <> 4,
        imbewu_products[sub_category] = "Maize Meal",
        Stores[province] = "Western Cape"
    )

    Avg Transaction Value 2024 = 
    DIVIDE(
        [Revenue 2024],
        [Transactions 2024],
        0
    )
```

```dax
Avg Transaction Value 2025 = 
    DIVIDE(
        [Revenue 2025],
        [Transactions 2025],
        0
    )
```

```dax
Avg Transaction Value Change % = 
    DIVIDE(
        [Avg Transaction Value 2025] - [Avg Transaction Value 2024],
        [Avg Transaction Value 2024],
        0
    ) 
```

```dax
Product unit price x quantity = (transaction_items[quantity]*transaction_items[unit_price_at_sale])
```

Revenue


