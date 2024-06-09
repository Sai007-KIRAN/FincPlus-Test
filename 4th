Represent the below problem in a high-level design diagram: 

-> Have a set of 250 users.
-> Each user has at least one account with assets, i.e. assets can be stocks or mutual funds
-> Each user will see his portfolio in real-time at any time of the day
->Prices come from different sources.
              * Design a platform to create, calculate, and maintain the portfolios of these users
              * Reliably and should scale.
              * The portfolios should be updated as soon as the source provides data for the platform.
              * The data gets refreshed every 10 minutes.


Approach: 

+-------------------+                +-------------------------+               +----------------+
|                   |                |                         |               |                |
|   Data Sources    +---------------->   Data Ingestion Layer  +--------------->   Database     |
| (Stock & Mutual   |  Fetch Prices  | (API, Streaming, etc.)  |   Store Data  | (NoSQL/SQL)   |
|  Fund Prices)     |                |                         |               |                |
+--------^----------+                +-------------^-----------+               +-------^--------+
         |                                           |                                   |
         |                                           |                                   |
         |                                      Push Data                        Fetch Portfolio
         |                                           |                                   |
+--------+----------+                +-------------+----------------+         +---------+---------+
|                   |                |                              |         |                   |
| User Portfolio    |  Fetch Prices  |      Portfolio Service      |         | User Interface    |
| Calculation Layer +<---------------+  (Calculate & Maintain      +---------> (Web/Mobile App)   |
|                   |                |   User Portfolios)          |         |                   |
+-------------------+                +-----------------------------+         +-------------------+


Components:

1.	Users: End users who have accounts and portfolio of assets.
2.	Web/Mobile Clients: User interface that allows users interact with the platform to get their real-time update
3.	API GateWay: Serves at the entry point for all client request 
    In Simple, Handles authentication, rate limiting, and routing request to appropriate services.
4.	User Management Service: Manages user information and authorization.
5.	Portfolio Service: * It will Handle the creation, Calculation, and maintenance 
                      *	It Ensures that portfolios are updated in real time based of new data.

6.	Pricing Service: Fetch Price data from various services
7.	Data Storage: * Stores all user information, user data and pricing data
                  *	Utilize database like SQL/NoSql  
8.	Notification Service: Sends Real-time updates and alerts when the portfolio data changes.
