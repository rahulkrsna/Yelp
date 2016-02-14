# Project 3 - *Yelp*

**Yelp** is a Yelp search app using the [Yelp API](http://www.yelp.com/developers/documentation/v2/search_api).

Time spent: **14** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] Table rows for search results should be dynamic height according to the content height.
- [X] Custom cells should have the proper Auto Layout constraints.
- [X] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).

The following **optional** features are implemented:

- [X] Search results page
- [X] Infinite scroll for restaurant results.
- [X] Implement map view of restaurant results.
- [ ] Implement the restaurant detail page.

The following **additional** features are implemented:

- [X] Custom Filters

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. 
2. 

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/0hUPo5I.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

1. I wanted to create different backgrounds for the table view cells, alternate rows with a different background, but couldn’t get it working at the end. When I applied the background, it is shown only on the rows that is currently visible, if we scroll then the backgrounds are not applied. Finally I switched to just adding a border to every cell.
2. I wanted to change the buttons on the navigation bar(items bar) to be oval shaped but when it was initially on the navigation bar, I wasn’t able to do it.
3. Once I navigate from the view with tableView to another page and comeback, for some reason the viewdidLoad() method is not called on my, so I had to place the API call in the viewDidAppear() for the updates to occur, but I am not completely satisfied with placing that control inside viewDidAppear(). Still to find a better approach here.


## License

    Copyright [2016] [Rahul Krishna Vasantham]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.