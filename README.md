# GPA Calculator 

A simple GPA calculator to explore AWS Mobile SDKv2 for iOS. 

The iOS application works as a GPA calculator. 

V1 features:

1. A table shows the course name, grade and the corresponding credits.
2. A label on the top shows the final GPA. 
3. New entries can be added easily. 
4. Old entries can be deleted by swiping a table row.
5. The total GPA is recalculated at each step. 
6. At each step the dataset is synced with SimpleDB. 

More features that can be implemented:

1. AWS Cognito can be used to authenticate user via identity pools (supports Facebook, Google) which get access keys for each session. Hence no client side storage of credentials is required. 

2. SimpleDB along with Cognito can be used to easily sync data across devices. 

3. Exception handling. 

