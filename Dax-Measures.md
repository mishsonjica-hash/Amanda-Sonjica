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

```dax
Revenue 2024 = 
    CALCULATE(
        [Total Revenue],
        YEAR(Transactions[transaction_date]) = 2024
    )
```

```dax
Revenue 2024 = 
    CALCULATE(
        [Total Revenue],
        YEAR(Transactions[transaction_date]) = 2025
    )
```

```dax
Revenue Change % = 
    DIVIDE(
        [Revenue 2025] - [Revenue 2024],
        [Revenue 2024],
        0
    )
```
Total Cost

```dax
Total Cost = 
SUMX(
    transaction_items, 
    transaction_items[quantity] * RELATED('imbewu_products'[unit_cost])
)
```
```dax
Total Profit = [Total Revenue]-[Total Cost]
```

```dax
Total Revenue = SUM(transaction_items[Product unit price x quantity])
```
```dax
Total Units = SUM(transaction_items[quantity])
```

Counts

```da
Transaction count = COUNT(transaction_items[item_id])
```

```da
Transaction Count Change % = 
    DIVIDE(
        [Transactions 2025] - [Transactions 2024],
        [Transactions 2024],
        0
    )
```
```da
Transactions 2024 = 
    CALCULATE(
        [Transaction count],
        YEAR(Transactions[transaction_date]) = 2024
    )
```

```da
    Transactions 2025 = 
    CALCULATE(
        [Transaction count],
        YEAR(Transactions[transaction_date]) = 2025
    )
```

```da
Occasional Customers 2025 = 
    VAR CustomerCounts =
        SUMMARIZE(
            FILTER(
                Transactions,
                YEAR(Transactions[transaction_date]) = 2025
                    && RELATED(Stores[province]) = "Western Cape"
            ),
            Transactions[customer_id],
            "TxnCount", DISTINCTCOUNT(Transactions[transaction_id])
        )
    RETURN
        COUNTROWS(FILTER(CustomerCounts, [TxnCount] >= 2 && [TxnCount] <= 4))
```

```da
    Regular Customers 2025 = 
    VAR CustomerCounts =
        SUMMARIZE(
            FILTER(
                Transactions,
                YEAR(Transactions[transaction_date]) = 2025
                    && RELATED(Stores[province]) = "Western Cape"
            ),
            Transactions[customer_id],
            "TxnCount", DISTINCTCOUNT(Transactions[transaction_id])
        )
    RETURN
        COUNTROWS(FILTER(CustomerCounts, [TxnCount] >= 5 && [TxnCount] <= 10))
```

```da
Province = SWITCH(
    TRUE(),
    'customers (1)'[home_suburb] IN {"Halfway Gardens", "Midrand", "Sandton", "Soweto","Alberton", "Midrand", "Boksburg", "Fourways", "Krugersdorp", "Centurion", "Rosebank", "Randburg", "Roodepoort", "Edenvale", "Brooklyn", "Menlyn", "Hatfield", "Wonderpark", "Berea"}, "Gauteng",
    'customers (1)'[home_suburb] IN {"Sea Point", "Bellville", "Parow", "Khayelitsha", "Sea Point", "Tygervalley", "Stellenbosch Central", "Constantia", "Paarl Central", "Bellville", "Mitchell's Plain", "Boksburg", "Claremont", "CBD", "George Central"}, "Western Cape",
    'customers (1)'[home_suburb] IN {"Umhlanga", "Pinetown", "Umhlanga", "Hayfields", "Phoenix", "Chatsworth", "PMB Central", "Ballito", "Richards Bay Central", "Westville", "Berea"}, "KwaZulu-Natal",
    "Eastern Cape"
)
```
