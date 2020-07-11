# prozone

# MOBILE ENGINEER ASSESSMENT
## ANSWERS,
## SECTION 1
This section tests your general theoritical knowledge of Android Development.

### Instructions
Provide an answer to each of the questions below. To select an answer just place an 'x' in the square bracket of the option you're selecting.

#### Question 1

If you want to have two variations of your application (for example, a free version and a paid version), what do you need to configure in your Gradle file in order to distinguish them?

- [ ] buildTypes
- [X] productFlavor
- [ ] splits


#### Question 2

You made an innovative PDF annotation application. How to make it appear among the applications available when you share a PDF from a third-party application?

- [ ] By declaring a broadcast receiver in the Manifesto of your application. By declaring a service in the Manifesto of your application.
- [X] By declaring an intent filter in the Manifesto of your application.

#### Question 3

How can you open a certain activity of your Android application when it receives a URL following a particular schema?

- [X] Via intent-filter
- [ ] Via broadcast receiver Via service
- [ ] Via Notification Manager

#### Question 4

What cannot be measured with the profiling tools of Android Studio? 

- [ ] RAM consumption of the application
- [X] The battery consumption of the application
- [ ] The latency between the user interaction and the execution of the action
- [ ] Incoming and outgoing network activity


#### Question 5

How to optimize the code of the application in order to put it into production? 

- [X] By authorizing the multidex
- [ ] By removing android: debuggable from the Gradle file 
- [ ] By increasing the heap size of the Gradle daemon Using code obfuscation/shrinking tools



---



## SECTION 2


### Brief
ProZone is a provider aggregator company, that has a large network of healthcare providers (Gym, Spas, Optical Centres, Hospitals etc.) that they work with.

They have provider officers that are responsible for signing up and managing these providers.

Build a simple mobile application that will be used by a  provider officer for managing providers that are currently in their network.

### Essential Features:
- View all providers registered in the network
- View details of a provider
- Add Providers
- Add images to a provider.

### Bonus Features:
- Filter providers based on type and onboarding status
- Search for providers using the provider name and/or location
- Update provider details (Active status, description, type etc.)


### API
API docs can be found [here](https://pro-zone.herokuapp.com/documentation/v1.0.0)

Use any of the following tokens to authenticate the requests:

| user| token|
| ----- | ------ |
|1|eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNTk0MTgzMzUwLCJleHAiOjE1OTY3NzUzNTB9.SS17FWeuomLQxAqyIEiPk0hTjLcKjh91XpM6U2X7dkM|
|2|eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNTk0MTg1NDczLCJleHAiOjE1OTY3Nzc0NzN9.BNp8WsyYR0WucmfuCxg_hrVZXTrgj0--lwTnyO-IBBg|


### Build Requirements

- Java or Dart (Flutter)


## Submission Instructions:
Once done, upload your submission to a github repo, go to **[this link](https://rel.hm/jpx5o)** and provide the submission url.  
Feel free to also include any information you want us to know about your submission in the email.
Remember to also include screenshots and the apk of your submission.

**Please DO NOT forget to include your answers to the first section in your submission**

Best of luck! :v: