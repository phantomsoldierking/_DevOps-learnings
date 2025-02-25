Why rate limitting (Distributed Denial of services)
 
1 Preventing Overload: Rate limiting controls how often a user or system can make requests to a service. This helps prevent overuse of resources, ensuring that the system remains available
and responsive for all users. For example, rate limiting can stop a single user from making thousands of login attempts in a minute, which could otherwise degrade service for others.

2 Mitigating Abuse: Without rate limiting, an application could be more susceptible to abuse such as brute force attacks on passwords or spamming behavior. By limiting how often someone can
perform an action, it reduces the feasibility of such attacks.

3 Managing Traffic: In high-traffic scenarios, like ticket sales for a popular event, rate limiting can help manage the load on a server, preventing crashes and ensuring a fairer distribution
of service like bandwidth or access to the purchasing system.

4 DDoS Protection: A DDoS attack involves overwhelming a site with a flood of traffic from multiple sources, which can make the website unavailable. DDoS protection mechanisms detect unusual
traffic flows and can filter out malicious traffic, helping to keep the service operational despite the attack.

Rate Limit: IPs(problem when multiple users share IPs, colleges etc), User, Application level

