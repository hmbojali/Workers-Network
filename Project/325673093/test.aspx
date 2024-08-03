<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html  
    xmlns="http://www.w3.org/1999/xhtml">  
    <head runat="server">  
        <title></title>  
    </head>  
    <body >  
        <p id="demo">Click the button to get your position:</p>  
        <button onclick="getLocation()">Get your Location</button>  
        <div id="mapholder" ></div>  
        <script type="text/javascript">  
            var x = document.getElementById("demo");
            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition, showError);
                }
                else { x.innerHTML = "Geolocation is not supported by this browser."; }
            }
            function showPosition(position) {
                var latlondata = position.coords.latitude + "," + position.coords.longitude;
                var latlon = "Latitude=" + position.coords.latitude + "," + "Longitude=" + position.coords.longitude;
                alert(latlon)
                var img_url = "https://www.google.com/maps/place/"+latlondata;
                document.getElementById("mapholder").innerHTML = "<iframe width=\"560\" height=\"315\" src=\""+img_url+"\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>";
            }
            function showError(error) {
                if (error.code == 1) {
                    x.innerHTML = "User denied the request for Geolocation."
                }
                else if (err.code == 2) {
                    x.innerHTML = "Location information is unavailable."
                }
                else if (err.code == 3) {
                    x.innerHTML = "The request to get user location timed out."
                }
                else {
                    x.innerHTML = "An unknown error occurred."
                }
            }
        </script>



        <form id="form1"  runat="server">  
            <div></div>
        </form>  
    </body>  
</html>  

