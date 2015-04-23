#Backend for Loong Project at Digital Invaders

Rails 4.2.0ruby  
Ruby 2.0.0p481  
Runing with sqlite 3  
####Available GET Request
* "home/getUsers"
  >* get all the  available users

####Available POST Request
* "user/setUserAsChild"  
  >* ###parameneters (fb_id, name, fb_id_parent)
  >* set a new user with **fb_id** and **name** or get the user if exist  
  >* set a REGISTER of the user being part of the parent 
 >* return a json with the user and the register data
* "user/setUserAsParent"
>* ###parameneters (fb_id, name)
>* set a new user with **fb_id** and **name** or get the user if exist  
>* return a json with the user info

### Installation

You need Rails and ruby installed