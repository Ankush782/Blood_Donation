<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.Criteria"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="data.*"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<html>
    <head>
        <style>
            .x:hover{
                background-color: red;
                color: white;
            }
            .x{
                
            }
            
        </style>
      
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
 <script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script> 
    </head>
    <body  style="background-color: #f6f6f6;">
        <%! int u,r; Robject x;StringBuilder sb;%>
        <% 
            x=new Robject();
            sb=new StringBuilder();
            
        SessionFactory sf=new Configuration().configure().buildSessionFactory();
        Session s=sf.openSession();
        s.beginTransaction();
    List users=    s.createCriteria(Users.class).list();
    u=users.size();
    Criteria cr=s.createCriteria(Ureq.class);
    cr.addOrder(Order.desc("id"));
    List<Ureq> req=cr.list();
    Ureq y;
   for(int i=0;i<10;i++)
    {
  y=(Ureq)req.get(i);
  x.setName(y.getName());
  x.setBg(y.getBgroup());
  x.setMob(y.getNumber());
  x.setPlace(y.getCity());
  x.setLocation(y.getPlace());
  x.setTime(y.getTime().toString());
   sb.append("<tr>");
   x.setBg("O+");
        sb.append("<td>");
        sb.append("<span class='glyphicon glyphicon-user'></span>");
        sb.append("  ");
        sb.append(x.getName());
        sb.append("</td>");
        sb.append("<td>");
        sb.append("<span class='glyphicon glyphicon-tint'></span>");
        sb.append("  ");
        sb.append(x.getBg());
        sb.append("</td>");
         sb.append("<td>");
        sb.append("<span class='glyphicon glyphicon-map-marker'></span>");
         sb.append("  ");
        sb.append(x.getPlace());
        sb.append("</td>");
        sb.append("<td>");
        sb.append("<span class='glyphicon glyphicon-time'></span>");
         sb.append("  ");
        sb.append(x.getTime());
        sb.append("</td>");
        sb.append("<td>");
        sb.append("<span class='glyphicon glyphicon-home'></span>");
         sb.append("  ");
        sb.append(x.getLocation());
        sb.append("</td>");
        sb.append("<td>");
        sb.append("<span class='glyphicon glyphicon-phone'></span>");
         sb.append("  ");
        sb.append(x.getMob());
        sb.append("</td>");
        sb.append("</tr>");
    }
   
       
        %>
       
        <nav class="navbar navbar-default navbar-fixed-top " style="margin-bottom: 0px;color: white;">
                <div class="container">
                <div class="navbar-header">
                    <div class="navbar-brand">
                        <a href="#" style="text-decoration: none">
                            <span class="glyphicon glyphicon-tint" style="color: red"></span>Blood Bank On Air
                         
                        </a>
                    </div>
                </div>
                 <ul class="nav navbar-nav " >
      <li class=""><a href="#donor">Donors</a></li>
      <li ><a href="#donor"  >I want blood</a></li>
       <li ><a href="#req"  >Recent request</a></li>
      <li><a href="#tip" class="x">Who can donate</a></li>
      <li><a href="#about" class="x">About us</a></li>
      <li><a href="#contact" class="x">Contact Us</a></li>
    </ul>
                    <ul class="nav navbar-nav navbar-right" style="margin-right: 0px;">
                         <li  class="navbar-btn" >
                             <button type="button" class="btn btn-danger " data-toggle="modal" data-target="#myModal2" style="margin-right:10px;"><span class="glyphicon glyphicon-log-in"></span> Login</button>

 
  
                        </li>
                        <li  class="navbar-btn" >
                            <button type="button" class="btn btn-danger " data-toggle="modal" data-target="#myModal" style="margin-right: 10px;"><span class="glyphicon glyphicon-user"></span> Sign up</button>


  
                        </li>
                       
                        
                        
                    </ul>
                </div>
            </nav>
        <div class=" text-center">
            <div class=" " style="margin-top: 50px;">
                <img src="images/patient.jpg" width="auto" height="750px" style="background-color: blue;">
            </div>
            <div class="jumbotron img-responsive" style="margin-top: 0px;  " id="donor" >
                <div style="opacity: 1.0;"> <h1>
                Blood Bank On Air 
            </h1>
            <p>A online blood request and donate platform where donor meets acceptor</p>
            <form class="form-inline " style="opacity:1.0;">
                <div class="input-group" >
		<input type="text" name="" placeholder="Enter your Email" size="50" class="form-control">
		<div class="input-group-btn">
			<button class="btn btn-danger">Subscribe</button>
		</div>
</div>
            </form><div>
            </div>
                </div></div></div>
        <div class="container-fluid text-center" id="">
            <div  style="">
                <div class="col-md-6 text-center " style=" height: 300px;">
                    <div  style="background-color: #e4e4e4;border-radius: 20px;height: 300px;padding: 20px;">
                        <h2 style="margin-top: 20px;font-size: 30px;" class="label label-danger" >
                        <span class="glyphicon glyphicon-globe" ></span>   Registered Users
                       
                    </h2>
                    <h2> <%=u%></h2>
                    <p>Daily a no of people are joining our community</p>
                    </div>
                </div>
            <div class="col-md-6" >
                <div style="background-color: #e4e4e4;border-radius: 20px;height: 300px;padding: 20px;">
                    <strong>   <h2 class="label label-danger"style="font-size: 30px">    <span class="glyphicon glyphicon-tint" ></span>   Request for Blood</h2></strong>
                <form class="form-horizontal" style="margin-top: 30px;margin-bottom: 30px;">
                    <div class="form-group">
                        <label for="name" class="control-label col-md-4" >Blood Group</label>
                        <div class="col-md-8">
                            <select class="form-control">
                                 <option>A+</option>
                                  <option>A-</option>
                                   <option>B+</option>
                                    <option>B-</option>
                                     <option>AB+</option>
                                      <option>AB-</option>
                                <option>O+</option>
                                 <option>O-</option>
                                 
                            </select>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="city" class="control-label col-md-4" >City</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="city" required="">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label for="location" class="control-label col-md-4" >Hospital/location</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="location" required="">
                        </div>  
                    </div>
                    <div class="col-md-offset-4">
                        <input type="submit" value="Request" class="btn btn-danger">
                    </div>
                </form>
            </div>
            </div>
            </div>
        </div>
     
       
                    <div class="container-fluid text-center " style="margin: 50px;" id="req">
                        <div style="background-color: #e4e4e4 ;padding: 50px;border-radius: 50px; ">
                            <h2 class="label label-danger" style="font-size: 30px;">Recent Requests</h2>
                        <table class="table table-striped table-hover" style="margin-top: 50px;">
                           
                            <%=sb.toString()%>
                        </table>
                        </div>
                    </div>
                        <div class="container-fluid text-center" style="margin: 50px;" id="tip">
                            <div class="" style="border-bottom-left-radius: 50px;border-top-right-radius: 50px;background-color:#e4e4e4;padding: 50px;height: 600px; ">
                            <div class="label label-danger" style="font-size: 30">Frequently asked questions</div>
                            <div class="row" style="margin-top: 20px;">
                            <div class="col-md-5" style="padding: 10px;">
                                <ul class="nav nav-pills nav-stacked text-left"  >
                                    <li><a href="#a" data-toggle="pill"> 1. Is blood donation safe for my health ?</a></li>
                                     <li><a href="#b"  data-toggle="pill">2. What are blood groups ?</a></li>
                                      <li><a href="#c"  data-toggle="pill">3. What about donors and acceptors ?</a></li>
                                      <li class="active"><a href="#d"  data-toggle="pill" class="active">4.when should not donate blood ?</a></li>
                                       <li><a href="#e"  data-toggle="pill">5 .What should a healthy donor eat ?</a></li>
                                </ul>
                            </div>
                            <div class="col-md-7" style="padding: 10px;">
                                <div class="tab-content">
                                   
                                        <div id="a" class="tab-pane fade-in ">
                                            <ul class="list-group text-left in">
                                                <li class="list-group-item"> Yes blood donation is safe for your health if you considered following points. </li>
                                                <li class="list-group-item"> A. Minimum age for blood donation should be 18 and maximum should be 60</li>
                                                <li class="list-group-item"> You should choose a reputed blood donation campaign</li>
                                                <li class="list-group-item"> You should be healthy enough to donate blood</li>
                                                <li class="list-group-item"> Minimum hemoglobin should be 12.5g/dl</li>
                                                <li class="list-group-item"> Your minimum weight should be 45kg</li> 
                                                <li class="list-group-item"> Your last blood_donation should be 3 months before</li>
                                                <li class="list-group-item"> You should be suffering from any diseases</li>
                                            </ul>
                                        </div>
                                         <div id="b" class="tab-pane fade-in  ">
                                            <ul class="list-group text-left in">
                                                <li class="list-group-item"> Blood type is determined by which antibodies and antigens the person's blood produces. An individual has two types of blood groups namely ABO-grouping and Rh-grouping. Rh is called as the Rhesus factor that has come to us from Rhesus monkeys.</br>

                                                    <p>    Most humans are in the ABO blood group. The ABO group has four categories namely </br>
                                                    1) A group 2) B group 3) O group and 4) AB group
                                                    In the Rh- group, either the individual is said to be Rh- Negative or Rh- Positive.</br>

                                                    Thus blood group of any human being will mainly fall in any one of the following groups.</br> 
                                                     A positive or A negative </br>
                                                     B positive or B negative </br>
                                                     O positive or O negative </br>
                                                     AB positive or AB negative.</p> </li>
                                               
                                                               
                                                
                                            </ul>
                                        </div>
                                         <div id="c" class="tab-pane fade text-left ">
                                            <ul class="list-group text-left in">
                                                <li class="list-group-item">

                                                   The most common blood type is O, followed by type A.

                                                      O individuals are often called "universal donors" since their blood can be transfused into persons with any blood type. Those with type AB blood are called "universal recipients" because they can receive blood of any type.

                                                       However, since approximately twice as many people in the general population have O and A blood types, a blood bank's need for this type of blood increases exponentially.
                                                </li>
                                               
                                                               
                                                
                                            </ul>
                                        </div>
                                         <div id="d" class="tab-pane fade-in active ">
                                           <ul class="list-group text-left in">
                                                <li class="list-group-item"> Cold / fever in the past 1 week. </li>
                                                <li class="list-group-item">Under treatment with antibiotics or any other medication.</li>
                                                <li class="list-group-item"> Cardiac problems, hypertension, epilepsy, diabetes (on insulin therapy), history of cancer, chronic kidney or liver disease, bleeding tendencies, venereal disease etc.</li>
                                                <li class="list-group-item"> Major surgery in the last 6 months.</li>
                                                <li class="list-group-item"> Vaccination in the last 24 hours.</li>
                                                <li class="list-group-item"> Had a miscarriage in the last 6 months or have been pregnant / lactating in the last one year</li> 
                                                <li class="list-group-item"> Had fainting attacks during last donation</li>
                                                <li class="list-group-item">Have regularly received treatment with blood products.</li>
                                                 <li class="list-group-item">Shared a needle to inject drugs/ have history of drug addiction.</li>
                                                  <li class="list-group-item">Had sexual relations with different partners or with a high risk individual</li>
                                                    <li class="list-group-item">Been tested positive for antibodies to HIV.</li>
                                            </ul>
                                        </div>
                                    <div id="e" class="tab-pane fade text-left ">
                                            <ul class="list-group text-left in">
                                                <li class="list-group-item">
                                                    A healthy diet helps ensure a successful blood donation, and also makes you feel better! Check out the following recommended foods to eat prior to your donation.</br>

	                                          1. Low fat foods</br>
	                                          2. Iron rich foods

                                                  
                                                </li>
                                               
                                                               
                                                
                                            </ul>
                                        </div>
                                </div>
                            </div>
                            </div>
                                
                            </div>
                        </div>
                        <div class="container-fluid text-center " style="margin: 50px;" id="about">
                        <div style="background-color: #e4e4e4 ;padding: 50px;border-bottom-left-radius: 50px;border-top-right-radius: 50px; ">
                            <h2 class="label label-danger" style="font-size: 30px;">About Us</h2>
                            <ul class="list-group text-left in" style="margin-top: 50px;">
                                                <li class="list-group-item">
                                                    <p>
                                                        'Blood Bank India' is the first product resulted out of the community welfare initiative called 'People Project' from uSiS Technologies. Universally, 'Blood' is recognized as the most precious element that sustains life. It saves innumerable lives across the world in a variety of conditions. Once in every 2- seconds, someone, somewhere is desperately in need of blood. More than 29 million units of blood components are transfused every year. The need for blood is great - on any given day, approximately 39,000 units of Red Blood Cells are needed. Each year, we could meet only up to 1% (approx) of our nation’s demand for blood transfusion.

Despite the increase in the number of donors, blood remains in short supply during emergencies, mainly attributed to the lack of information and accessibility. We positively believe this tool can overcome most of these challenges by effectively connecting the blood donors with the blood recipients.
                                                    </p>

                                                  
                                                </li>
                                               
                                                               
                                                
                                            </ul>
                        </div>
                    </div>
                        
                        <div class="container-fluid text-center" id="contact">
                                                    <div style="background-color: #e4e4e4 ;padding: 50px;border-bottom-left-radius: 50px;border-top-right-radius: 50px; ">
                                                         <h2 class="label label-danger" style="font-size: 30px;">Contact  Us</h2>
                                                         <div class="row" style="margin-top: 30px;">
                                                             <div class="col-md-3"></div>
                                                             <div class="col-md-6" style="background-color: white;border-radius: 30px;padding: 20px;">
                                                                 <form class="form-horizontal" method="post" action="ask" style="margin-top: 30px;margin-bottom: 30px;">
                    <div class="form-group">
                        <label for="name" class="control-label col-md-4" >Full Name</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="name">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="email" class="control-label col-md-4" >Email</label>
                        <div class="col-md-8">
                            <input type="email" class="form-control" name="email">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label for="mob" class="control-label col-md-4" >Contact</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="mob">
                        </div> 
                    </div>
                     <div class="form-group">
                        <label for="city" class="control-label col-md-4" >City</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="city">
                        </div> 
                    </div> 
               <textarea class="form-control" rows="5" placeholder="Enter your querry" name="query"></textarea> 
                    <div class="">
                        <input type="submit" value="Ask" class="btn btn-danger" style="margin-top: 20px;">
                    </div>
                </form>
                                                             </div>
                                                             <div class="col-md-3"></div>
                                                         </div>
                                                         <div class="container-fluid" id="map" style="height: 500px; margin-top: 30px;border-radius: 50px;" ></div>
                                                    </div>
                        </div>
                       
<script type="text/javascript">
	function mymap()
	{
		var pro={
			center:new google.maps.LatLng(41.878114, -87.629798),
			zoom:15,
			scrollwheel:false,
			draggable:false,
		mapTypeId:google.maps.MapTypeId.ROADMAP };
			var map=new google.maps.Map(document.getElementById("map"),pro);
			var m=new google.maps.Marker(
				{position:new google.maps.LatLng(41.878114, -87.629798)
					,animation:google.maps.Animation.BOUNCE}
				);
			m.setMap(map);
		
	}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-9YAxSHNAQcara7ZlPwSYyP_0rR1QqX4&callback=mymap"></script>
   <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header text-center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div class="modal-title label label-danger text-center" style="font-size: 20px;">Sign Up</div>
        </div>
        <div class="modal-body">
            <form class="form form-horizontal" method="post" action="signup">
                <div class="form-group">
                    <label for="fname" class="control-label col-md-3">First Name</label>
                    <div class="col-md-9">
                        <input type="text" name="fname"class="form-control" placeholder="First Name" id="fname" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fname" class="control-label col-md-3">Last Name</label>
                    <div class="col-md-9">
                        <input type="text" name="lname"class="form-control" placeholder="Last Name" id="lname" required>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="sex" class="control-label col-md-3">Gender</label>
                    <div class="col-md-9">
                        Male   <input type="radio" name="sex" value="male" >   Female  <input type="radio" name="sex" value="female" >
                    </div>
                </div>
                 <div class="form-group">
                    <label for="age" class="control-label col-md-3" required>Age</label>
                    <div class="col-md-9">
                        <select name="age" class="form-control" required>
  <option>18</option>
 <option>19</option>
 <option>20</option>
 <option>21</option>
 <option>22</option>
 <option>23</option>
 <option>24</option> 
 <option>25</option>
 <option>26</option>
 <option>27</option>
 <option>28</option>
 <option>29</option>
 <option>30</option>
 <option>31</option> 
 <option>32</option>
 <option>33</option> 
 <option>34</option>
 <option>35</option>
 <option>36</option>
 <option>37</option>
 <option>38</option>
 <option>39</option> 
<option>40</option> 
 <option>41</option>
 <option>42</option>
 <option>43</option>
 <option>44</option> 
 <option>45</option>
 <option>46</option>
 <option>47</option>
 <option>48</option>
 <option>49</option>
 <option>50</option>
 <option>51</option>
 <option>52</option> 
 <option>53</option>
 <option>54</option>
 <option>55</option>
 <option>56</option>
 <option>57</option>
 <option>58</option>
 <option>59</option> 
</select>
                    </div>
                    
                </div>
                 <div class="form-group">
                    <label for="address" class="control-label col-md-3">Address</label>
                    <div class="col-md-9">
                        <input type="text" name="address" class="form-control " required>   
                    </div>
                </div>
                 <div class="form-group">
                    <label for="city" class="control-label col-md-3">City</label>
                    <div class="col-md-9">
                        <input type="text" name="city" class="form-control" required>   
                    </div>
                </div>
                <div class="form-group">
                    <label for="state" class="control-label col-md-3">State</label>
                    <div class="col-md-9">
                        <input type="text" name="state" class="form-control" required>   
                    </div>
                </div>
                <div class="form-group">
                    <label for="country" class="control-label col-md-3">Country</label>
                    <div class="col-md-9">
                        <input type="text" name="country" class="form-control" required>   
                    </div>
                </div>
                 <div class="form-group">
                    <label for="pin" class="control-label col-md-3">Pin</label>
                    <div class="col-md-9">
                        <input type="text" name="pin" class="form-control" required>   
                    </div>
                </div>
                 <div class="form-group">
                    <label for="email" class="control-label col-md-3">Email</label>
                    <div class="col-md-9">
                        <input type="email" name="email" class="form-control" required>   
                    </div>
                </div>
                 <div class="form-group">
                    <label for="number" class="control-label col-md-3">Mobile</label>
                    <div class="col-md-9">
                        <input type="text" name="number" class="form-control" required>   
                    </div>
                </div>
                <div class="form-group">
                        <label for="name" class="control-label col-md-3" >Blood Group</label>
                        <div class="col-md-9">
                            <select class="form-control" name="bgroup" required>
                                 <option>A+</option>
                                  <option>A-</option>
                                   <option>B+</option>
                                    <option>B-</option>
                                     <option>AB+</option>
                                      <option>AB-</option>
                                <option>O+</option>
                                 <option>O-</option>
                                 
                            </select>
                        </div>
                    </div>
                <div class="form-group">
                    <label for="option" class="control-label col-md-3">I want to </label>
                    <div class="col-md-9">
                        Donate <input type="checkbox" name="donate" checked="true"> Accept <input type="checkbox" name="accept" >
                    </div>
                </div>
                 <div class="form-group">
                    <label for="password" class="control-label col-md-3">Password</label>
                    <div class="col-md-9">
                        <input type="password" name="password" class="form-control" required>   
                    </div>
                </div>
                  <div class="form-group">
                    <label for="cpassword" class="control-label col-md-3">Confirm Password</label>
                    <div class="col-md-9">
                        <input type="password" name="cpassword" class="form-control" required>   
                    </div>
                </div>
                <input type="submit" class="btn btn-danger col-md-offset-3">
                
            </form>
        </div>
        <div class="modal-footer">
            <p id="message"></p>
        </div>
      </div>
      
    </div>
  </div>
     
<div class="modal fade" id="myModal2">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                       <button type="button" class="close" data-dismiss="modal">&times;</button>

                <div class="modal-title label label-danger" style="font-size: 20px">Login</div>
            </div>
            <div class="modal-body">
                <form class="form form-horizontal" action="login" method="post">
                    <div class="form-group">
                    <label for="email" class="control-label col-md-3">Email</label>
                    <div class="col-md-9">
                        <input type="email" name="email" class="form-control" required="">   
                    </div>
                </div>
                    <div class="form-group">
                    <label for="password" class="control-label col-md-3">Password</label>
                    <div class="col-md-9">
                        <input type="password" name="password" class="form-control" required="">   
                    </div>
                </div>
                    <input type="submit" class="btn btn-danger col-md-offset-3" value="submit" >
                </form>
            </div>
            <div class="modal-footer">
                
            </div>
        </div>
    </div>
</div>
    </body>
    
  
</html>