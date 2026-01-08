# NoSQL Database Analysis – FlexiMart

## Section A: Limitations of RDBMS 

Relational databases like MySQL work well when data has a fixed and predictable structure. However, they struggle when managing highly diverse product catalogs. In an e-commerce platform like FlexiMart, different products have different attributes. For example, laptops require specifications such as RAM, processor, and storage, while shoes require size, color, and material. Representing these variations in an RDBMS requires either many nullable columns or multiple related tables, which increases complexity.

Frequent schema changes are another limitation. Introducing new product types often requires altering table structures, which can be time-consuming and risky in production systems. Additionally, storing nested data such as customer reviews, ratings, and comments requires separate tables and joins, leading to performance overhead. As the data grows, complex joins across multiple tables reduce query performance and make maintenance difficult. These limitations make traditional relational databases less suitable for handling flexible and evolving product data models.

---

## Section B: NoSQL Benefits 

MongoDB addresses these challenges through its flexible document-based data model. Each product can be stored as a document with its own set of attributes, allowing laptops, shoes, and groceries to coexist without enforcing a rigid schema. This flexibility eliminates the need for frequent schema migrations when new product types are introduced.

MongoDB also supports embedded documents, making it ideal for storing nested data such as customer reviews within product documents. This reduces the need for joins and improves read performance. Additionally, MongoDB is designed for horizontal scalability using sharding, allowing data to be distributed across multiple servers. This makes it suitable for large-scale e-commerce platforms with growing catalogs and high traffic. Overall, MongoDB provides better adaptability, performance, and scalability for managing diverse and evolving product data.

---

## Section C: Trade-offs 

Despite its flexibility, MongoDB has certain trade-offs when compared to relational databases. One major disadvantage is weaker support for complex transactions and joins, which are handled more efficiently in RDBMS systems like MySQL. Maintaining data consistency across multiple collections can be challenging.

Another drawback is the lack of enforced schema constraints, which places greater responsibility on the application layer to ensure data validation and integrity. For systems requiring strict consistency and complex relational queries, relational databases may still be a better choice.
