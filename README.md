# TopStories
The purpose of this project is to access top stories for New York Times [API](https://api.nytimes.com/svc/topstories/v2/home.json?api-key=1). 


## Architectural Patterns:
The app makes use of the MVVM-C (Model-View-ViewModel-Coordinator) architectural pattern. 

## Network Layer  
### Components - Generic  
Visual Representation can be found [here](https://goo.gl/A65BkT).

- **Request**: Represents the Network Request Object. It also has a convenience method to transform the Request into *URLRequest* which can then be provided to *URLSession* or any other networking library such as *Alamofire* etc.
- **TaskProtocol**: Represents a Task. Task is one unit of work (such as fetching public photos, user login etc.). Task makes a network call (via Service) and then transform the returning (JSON) response into a model.
- **Service** and **ServiceProtocol**: The layer/component making the network calls. It takes request object and returns a response object (enum). Error handling and *Data* to JSON conversion is performed inside *Response*. *Service Protocol* defines structure of the Service(s).
- **Response**: Represents the response returned by the Service to the Task (Service is the entity executing the network calls and task represents one API call). It returns well defined output (error or Response Object) to the task.

### Implementation Specific:
Visual Representation can be found [here](https://goo.gl/syzTaH).

- **APIRequest**: Implements *Request* protocol for API specific requests such as fetch top stories etc. Here we define all the components for each of the api requests.
- **TopStoriesTask**: Represents the Top Stories Fetching Task. It fetches the top stories from New York Time API and returns a List object. Conforms to *Task* protocol.
- **MockService**: Special Service that skips the network call and returns contents (already passed to it). It is used for Testing purpose (Testing the network layer without actually making a network call).
