<%@ page import="java.sql.*" %> 

<html>
    <head>

        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="dashboard.css">
        <link rel="stylesheet" href="checkout.css">
        <script type="text/javascript">
function openNav() {
  document.getElementById("mySidepanel").style.width = "200px"
  document.getElementById("mySidepanel").style.height = "1000px";
}

function closeNav() {
  document.getElementById("mySidepanel").style.width = "0";
}
</script>
    </head>

    <body >
        <%@ include file="DashTemplate.jsp" %>
        
        <%
        
          ResultSet rs = (ResultSet) request.getAttribute("rs");
          ResultSet userinfo = (ResultSet) request.getAttribute("userinfo");

          String startdate = (String) request.getAttribute("startdate");
          String starttime = (String) request.getAttribute("starttime");
          String enddate = (String) request.getAttribute("enddate");
          String endtime = (String) request.getAttribute("endtime");
          int stotal=(int)request.getAttribute("stotal");
          String arp=(String)request.getAttribute("air");
          String cwp=(String)request.getAttribute("cwp");
          String csp=(String)request.getAttribute("csp");
          Long minutes = (Long) request.getAttribute("minutes");
          Long lprice = minutes/60*25;
          int price=lprice.intValue();  
          int total = price + stotal;

          
          

          rs.next();
          userinfo.next();
          
              int slotno = rs.getInt("slotno");
              int loc_id = rs.getInt("loc_id");
              int sid = rs.getInt("sid");
              int type =rs.getInt("stype");
              String location = rs.getString("lname");
              float rating = rs.getFloat("rating"); 
              int workerid = rs.getInt("userid");

              String username = userinfo.getString("username");
              int userid = userinfo.getInt("userid");
              int wallet = userinfo.getInt("wallet");
              String promocode = userinfo.getString("promocode");
              




        %>
        
                
         <header class = "bg1">
    <!--<div class="container">
      <div class="navigation">

        <div class="logo">
          <i class="icon icon-basket"></i>shop42</div>
        <div class="secure">
          <i class="icon icon-shield"></i>
          <span>Secure Checkout</span>

        </div>
      </div>-->
      <div class="notification">
        <h1 class="display-6">Summary</h1>
      </div>
    </div>
  </header>
  <section class="content">

    <div class="container">

    </div>
    <div class="details shadow">
      <div class="details__item">

        <!--<div class="item__image">
          <img class="iphone" src="https://www.apple.com/v/iphone/compare/k/images/overview/compare_iphoneXSmax_silver_large.jpg" alt="">
        </div>-->
        <div class="item__details">
          <div class="item__title">
             Slot <%= slotno%>
            
          </div>
          <div class="item__price">
              <%= location%>
          </div>
          <div class="item__quantity" style = "font-size: 1.8em">
           &#8377 <%= total %>
          </div>
          <br>
          <div class="item__description">
            <ul style="">
              Rating: <%=rating%>
              <li>Services:</li>
              <li>Air Filling: <%=arp%></li>
              <li>Car Wash: <%=cwp%></li>
              <li>Car Service: <%=csp%></li>
            </ul>

          </div>
          <div class="item__price">
          <%=startdate%> <%=starttime%> to <%=enddate%> <%=endtime%>
          </div>

        </div>
      </div>

    </div>
    <div class="discount"></div>

    <div class="container">
      <div class="payment">
        <div class="payment__title">
          Payment Method
        </div>
        <div class="payment__types">
          <div class="payment__type payment__type--cc active">
            <i class="icon icon-credit-card"></i>Wallet</div>
          <div class="payment__type payment__type--paypal">
            <i class="icon icon-paypal"></i>Credit Card</div>
          <div class="payment__type payment__type--paypal">
            <i class="icon icon-wallet"></i>UPI</div>
          <div class="payment__type payment__type--paypal">
            <i class="icon icon-wallet"></i>SEPA</div>
        </div>

        <!--<div class="payment__info">
          <div class="payment__cc">
            <div class="payment__title">
              <i class="icon icon-user"></i>Personal Information
            </div>
            <form>
              <div class="form__cc">
                <div class="row">
                  <div class="field">
                    <div class="title">Credit Card Number
                    </div>
                    <input type="text" class="input txt text-validated" value="4542 9931 9292 2293" />
                  </div>
                </div>
                <div class="row">
                  <div class="field small">
                    <div class="title">Expiry Date
                    </div>
                    <select class="input ddl">
                      <option selected>01</option>
                      <option>02</option>
                      <option>03</option>
                      <option>04</option>
                      <option>05</option>
                      <option>06</option>
                      <option>07</option>
                      <option>08</option>
                      <option>09</option>
                      <option>10</option>
                      <option>11</option>
                      <option>12</option>
                    </select>
                    <select class="input ddl">
                      <option>01</option>
                      <option>02</option>
                      <option>03</option>
                      <option>04</option>
                      <option>05</option>
                      <option>06</option>
                      <option>07</option>
                      <option>08</option>
                      <option>09</option>
                      <option>10</option>
                      <option>11</option>
                      <option>12</option>
                      <option>13</option>
                      <option>14</option>
                      <option>15</option>
                      <option selected>16</option>
                      <option>17</option>
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
                    </select>
                  </div>
                  <div class="field small">
                    <div class="title">CVV Code
                      <span class="numberCircle">?</span>
                    </div>
                    <input type="text" class="input txt" />
                  </div>
                </div>
                <div class="row">
                  <div class="field">
                    <div class="title">Name on Card
                    </div>
                    <input type="text" class="input txt" />
                  </div>
                </div>

              </div>
            </form>
          </div>
          <div class="payment__shipping">
            <div class="payment__title">
              <i class="icon icon-plane"></i> Shiping Information
            </div>
            <div class="details__user">
              <div class="user__name">John Doe
                <br> 13/03/1980</div>
              <div class="user__address">Shipping Address: 22 Street, Address
                <br>Country</div>
            </div>

          </div>
        </div>-->
        <%-- <center> --%>
                <div class="payment__shipping">
                    <div class="payment__title">
                    <i class="icon icon-plane"></i> 
                    </div>Wallet Information
                    <div class="details__user">Username = <%=username%>
                    <div class="user__name">Present Balance = <%= wallet%>
                    
                         </div>After Deduction = <%= wallet - price - stotal%>
                    <div class="user__address">
                        <br></div> 
                 </div>
              

          </div>
      </div>
    </div>
    <%-- </center> --%>
    <div class="container">
      <div class="actions">
<i class="icon icon-arrow-right-circle"></i>
        </a>
        <%
        if(wallet<(total))
        {
          %> Not Enough Balance<%
        }

        else
        {
          %>



          Enter Promo Code:<input class="form-control" name="promo" id = "promocode" style="width : 50%">
          <input type="hidden" id="promocode_actual" name="promocode" value= "<%= promocode %>">
          <br><button type="button" class="btn btn-dark" id = "Checkbtn">Check</button><br>
          <h5 id = "finalcost"></h5>



        <form method="GET" action="booked">
        <input type="hidden" id="startdate" name="startdate" value= "<%= startdate %>">
        <input type="hidden" id="enddate" name="enddate" value= "<%= enddate %>">
        <input type="hidden" id="starttime" name="starttime" value= "<%= starttime %>">
        <input type="hidden" id="endtime" name="endtime" value= "<%= endtime %>">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
        <input type="hidden" id="total" name="total" value= "<%= total %>">
        <input type="hidden" id="userid" name="userid" value= "<%= userid %>">
        <%-- <input type="hidden" id="username" name="username" value= "<%= username %>"> --%>
        <input type="hidden" id="username" name="workerid" value= "<%= workerid %>">
        <button class="btn action__submit">Place your Order
          
        </form>
        <%
        }
        %>
        <!--<a href="#" class="backBtn">Go Back to Shop</a>-->

      </div>
  </section>
  </div>
  <script src = "./checkout.js"></script>

</body>
</html>