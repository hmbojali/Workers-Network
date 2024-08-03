<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wfGame.aspx.cs" Inherits="wfGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Text1 {
            margin-top: 0px;
        }
        #form1 {
            direction: ltr;
        }
    </style>
</head>
<body id="Document" style="height:100%; margin:0">
    <form id="form1" runat="server" style="height:100%">
        <asp:Image ID="Frame" runat="server" Height="100%" ImageUrl="~/Game/Images/Frame.png" Width="100%" style="position:absolute; left:0px; top:0px" />
        
        
        <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center;">
            <div style="width:100%; height:60px; display:flex; flex-direction:row; align-items:center;">
                <div style="width:15%; height:60px; display:flex; flex-direction:row; align-items:center;">
                    <asp:ImageButton ID="btnHomePage" runat="server" ImageUrl="~/Game/Images/LogoGame2.png" style="z-index:3; height: 45px; width: 190px; margin-left:20px" BackColor="#000066" BorderColor="#000055" BorderStyle="Outset" BorderWidth="5px" OnClick="btnHomePage_Click"/>
                </div>
                <div style="width:80%; height:60px; display:flex; flex-direction:column; align-items:center;">
                    <div style="width:100%;height:60px; display:flex; flex-direction:row; align-items:center;">
                        <div style="width:30%; height:60px; display:flex; flex-direction:column; align-items:center;">
                            <div style="height:60px; display:flex; flex-direction:row; align-items:center;">
                               <asp:Image ID="MineImage" runat="server" style="z-index:5;" ImageUrl="~/Game/Images/Mine.png" Height="50px" Width="50px" />
                               <asp:Label ID="lblMine" runat="server" Text="Mine" Font-Bold="True" style="color:#880000; z-index:5; margin-right:20px" Font-Size="25pt" ></asp:Label>

                               <asp:Image ID="FoodImage" runat="server" style="z-index:5;" ImageUrl="~/Game/Images/Food.png" Height="30px" Width="30px"/>
                               <asp:Label ID="lblFood" runat="server" Text="Food" Font-Bold="True" style="color:#008800; z-index:5" Font-Size="25pt" ></asp:Label>
                            </div>
                        </div>

                        <div style="width:40%; display:flex; flex-direction:column; align-items:center;">
                       <asp:Label ID="lblScore" runat="server" Text="Score:0" Font-Bold="True" style="color:#bb0000; z-index:5" Font-Italic="True" Font-Size="30pt" ></asp:Label>
                        </div>
                      
                        <div style="width:40%; height:60px; display:flex; flex-direction:row; align-items:center;">
                           <asp:Label ID="lblHighScore" runat="server" Text="High Score:" Font-Bold="True" style="color:#bb0000; z-index:5; margin-right:40px" Font-Italic="True" Font-Size="25pt" ></asp:Label>
                           <asp:Label ID="lblAttempts" runat="server" Text="Attempts:" Font-Bold="True" style="color:#bb0000; z-index:5" Font-Italic="True" Font-Size="25pt" ></asp:Label>
                        </div>
                    </div>
                </div>
                <div style="width:5%; height:60px; display:flex; flex-direction:row; align-items:center;">

                </div>
            </div>
            <div style="height:100%; display:flex; flex-direction:row; align-items:center;">
                <div style="display:flex; flex-direction:column; align-items:center; padding-bottom:63px">
                   <asp:Label ID="lblFinalScore" runat="server" Text="Score:" Font-Bold="True" style="display:none; color:#bb0000; z-index:5; font:bold 80px GreatVibes" Font-Italic="True" Font-Size="30pt" ></asp:Label>
                   <asp:Label ID="lblPlayAgain" runat="server" Text="press ENTER to play again" style=" display:none; z-index:5; font:bold 30px GreatVibes" ForeColor="#000066"></asp:Label>
                </div>
            </div>
       </div>


        <asp:Image ID="Player" runat="server" style="position:absolute; top: 301px; left: 763px; height: 35px; width: 35px;" BackColor="Transparent" BorderColor="Transparent" ImageUrl="~/Game/Images/pixil-frame-0.png" />
        <asp:Image ID="Food" runat="server" BackColor="Transparent" BorderColor="Transparent" style="position:absolute; top: 300px; left: 136px; height: 25px; width: 25px; visibility:hidden" ImageUrl="~/Game/Images/Food.png"/>
        
        <asp:Label ID="foodp" runat="server" style="position:absolute; top: 37px; left: 13px; display:none"></asp:Label>
        <asp:Label ID="playerp" runat="server" style="position:absolute; top: 68px; left: 12px; display:none"></asp:Label>
       
        <asp:Label ID="ScoreVal" runat="server" Text="0" Font-Bold="False" style="position:absolute; top: 15px; left:800px; height:0px; width: 0px; bottom: 668px; visibility:hidden; z-index:5" Font-Italic="False" Font-Size="20pt" ForeColor="#000066" Height="0px" Width="0px"></asp:Label>
        <asp:TextBox ID="txtbxScoreVal" runat="server" Text="0" style="display:none"></asp:TextBox>
        <asp:Button ID="btnCS" style="display:none" runat="server" Text="Button" OnClick="btnCS_Click" />
    <div>
    
    </div>

    <script>
        {
            var flag = false;
            var aInUse = false;
            var wInUse = false;
            var sInUse = false;
            var dInUse = false;
            var stop = false;
            var speed = 15;
            var pixelSkip = 3;
            var minesNum = 0;
            var intervalD;
            var intervalA;
            var intervalW;
            var intervalS;
            var audioEnd = new Audio("Audios/End.wav");
            var audioExplosion = new Audio("Audios/Mine%20Explodes.wav");
            var audioChillMusic = new Audio("Audios/level%20music.wav");
            var audioNormalMusic = new Audio("Audios/Normal%20level%20music.wav");
            var audioSuspenseMusic1 = new Audio("Audios/Suspense%20level%20music.wav");
            var audioSuspenseMusic2 = new Audio("Audios/Suspense%20level%20music2.wav");
            var audioFoodEaten = new Audio("Audios/Food%20eaten.wav");
            var audioSigmentfinished = new Audio("Audios/Sigment%20finished.wav");
            var stopper=true;

        }

        function dead() {
            stop = true;
            aInUse = true;
            wInUse = true;
            sInUse = true;
            dInUse = true;
            if(audioChillMusic.played) audioChillMusic.pause();
            if (audioNormalMusic.played) audioNormalMusic.pause();
            if (audioSuspenseMusic1.played) audioSuspenseMusic1.pause();
            if (audioSuspenseMusic2.played) audioSuspenseMusic2.pause();
            audioExplosion.play();
            var delay = setTimeout(() => {
                document.getElementById("lblFinalScore").textContent += document.getElementById("ScoreVal").textContent;
                document.getElementById("lblFinalScore").style.display="block";
                document.getElementById("lblPlayAgain").style.display = "block";
                document.getElementById("Document").style.background = "grey";
                audioEnd.play();
            }, 2000);
            document.onkeydown =
                function () {
                    var k = event.key;
                    if (k == "Enter") {
                        document.getElementById("txtbxScoreVal").value = document.getElementById("ScoreVal").textContent;
                        document.getElementById("btnCS").click();
                    }
                    
                }
        }

        function speedUp() {
            speed = speed - speed / 15;
        }

        document.onkeydown =
            function ()
            {
                


                if (event.repeat)
                    return;

                var x = parseInt(document.getElementById("Player").style.left);
                var y = parseInt(document.getElementById("Player").style.top);
                var k = event.key;

                if (stopper && (k == "d" || k == "a" || k == "s" || k == "w")) {
                    audioChillMusic.play();
                    audioChillMusic.loop = true;
                    stopper = false;
                }

                if (k == " ")
                {
                    flag = !flag;
                    aInUse = flag;
                    wInUse = flag;
                    sInUse = flag;
                    dInUse = flag;
                }

                if (k == "d" && !dInUse) {
                    dInUse = true;
                    intervalD = setInterval(function () {

                        if (aInUse || sInUse || wInUse) {
                            clearInterval(intervalD);
                            dInUse = false;
                        }
                        else {
                            x = parseInt(document.getElementById("Player").style.left);
                            document.getElementById("Player").style.left = x + pixelSkip + 'px';
                            moving();
                            
                        }

                    }, speed);
                }
                if (k == "a" && !aInUse) {
                    aInUse = true;
                    intervalA = setInterval(function () {

                        if (dInUse || sInUse || wInUse) {
                            clearInterval(intervalA);
                            aInUse = false;
                        }
                        else {
                            x = parseInt(document.getElementById("Player").style.left);
                            document.getElementById("Player").style.left = x - pixelSkip + 'px';
                            moving();
                        }

                    }, speed);
                }
                if (k == "w" && !wInUse) {
                    wInUse = true;
                    intervalW = setInterval(function () {

                        if (aInUse || sInUse || dInUse) {
                            clearInterval(intervalW);
                            wInUse = false;
                        }
                        else {
                            y = parseInt(document.getElementById("Player").style.top);
                            document.getElementById("Player").style.top = y - pixelSkip + 'px';
                            moving();
                        }

                    }, speed);
                }
                if (k == "s" && !sInUse) {
                    sInUse = true;
                    intervalS = setInterval(function () {

                        if (aInUse || dInUse || wInUse) {
                            clearInterval(intervalS);
                            sInUse = false;
                        }
                        else {
                            y = parseInt(document.getElementById("Player").style.top);
                            document.getElementById("Player").style.top = y + pixelSkip + 'px';
                            moving();
                        }

                    }, speed);
                }

                if (stop)
                {
                    return;
                }
                

                document.getElementById("Food").style.visibility = "visible";

                x = parseInt(document.getElementById("Player").style.left);
                y = parseInt(document.getElementById("Player").style.top);


                function moving() {

                    //adding positiong vars
                    {
                        var xMin = parseInt(document.getElementById("Player").style.left);//left pos of the player 
                        var yMin = parseInt(document.getElementById("Player").style.top);//top pos of the player
                        var xMax = xMin + parseInt(document.getElementById("Player").style.width);//right pos of the player
                        var yMax = yMin + parseInt(document.getElementById("Player").style.height);//down pos of the player
                        var foodXMin = parseInt(document.getElementById("Food").style.left);//left pos of the food
                        var foodYMin = parseInt(document.getElementById("Food").style.top);//top pos of the food
                        var foodXMax = foodXMin + parseInt(document.getElementById("Food").style.width);//right pos of the food
                        var foodYMax = foodYMin + parseInt(document.getElementById("Food").style.height);//down pos of the food
                        document.getElementById("playerp").textContent = "min x:" + xMin + "  min y:" + yMin + "  max x:" + xMax + "  max y:" + yMax;//player pos display (for devs)
                        document.getElementById("foodp").textContent = "min x:" + foodXMin + "  min y:" + foodYMin + "  max x:" + foodXMax + "  max y:" + foodYMax;//food pos display (for devs)
                    }
                    //end
                
                    //checking if the player has colided with mines or walls
                    {
                        if (xMin < 15)
                            dead();
                        if (yMin < 63)
                            dead();
                        if (xMax > window.screen.availWidth-15)//this is the right edge of the screen
                            dead();
                        if (yMax > window.screen.availHeight-115)//this is the lower edge of the screen
                            dead();
                        for (i = 1; i < minesNum + 1 ; i++) {
                            var MineXMin = parseInt(document.getElementById("Mine" + i).style.left);//left pos of the Mine
                            var MineYMin = parseInt(document.getElementById("Mine" + i).style.top);//top pos of the Mine
                            var MineXMax = MineXMin + parseInt(document.getElementById("Mine" + i).style.width);//right pos of the Mine
                            var MineYMax = MineYMin + parseInt(document.getElementById("Mine" + i).style.height);//down pos of the Mine
                            if (xMin > MineXMin && xMin < MineXMax) {
                                if (yMin > MineYMin && yMin < MineYMax){
                                    dead();
                                    return;
                                }
                                else if (yMax > MineYMin && yMax < MineYMax) {
                                    dead();
                                    return;
                                }
                            }
                            if (xMax > MineXMin && xMax < MineXMax) {
                                if (yMin > MineYMin && yMin < MineYMax)
                                    dead();
                                else if (yMax > MineYMin && yMax < MineYMax)
                                    dead();
                            }
                        }
                    }
                    //end


                    //checking if food is eaten
                    {
                        var hungry = true;

                        if (foodXMin > xMin && foodXMin < xMax) {
                            if (foodYMin > yMin && foodYMin < yMax) {
                                eaten();
                            }
                            else if (foodYMax > yMin && foodYMax < yMax) {
                                eaten();
                            }
                        }
                        if (foodXMax > xMin && foodXMax < xMax) {
                            if (foodYMin > yMin && foodYMin < yMax){
                                eaten();
                            }
                            else if (foodYMax > yMin && foodYMax < yMax){
                                eaten();
                            }
                        }

                        function eaten(){
                            document.getElementById("ScoreVal").textContent = (parseInt(document.getElementById("ScoreVal").textContent) + 1) + "";
                            document.getElementById("lblScore").textContent = "Score:" + document.getElementById("ScoreVal").textContent;

                            if (parseInt(document.getElementById("ScoreVal").textContent) == 5) {
                                audioChillMusic.pause();
                                audioSigmentfinished.play();
                                var temp = "#bb0000";
                                var delay;
                                document.getElementById("lblScore").style.color = "red";
                                delay = setTimeout(() => {
                                    document.getElementById("lblScore").style.color = temp;
                                }, 400);
                                delay = setTimeout(() => {
                                    document.getElementById("lblScore").style.color = "red";
                                }, 600);
                                delay = setTimeout(() => {
                                    document.getElementById("lblScore").style.color = temp;
                                }, 800);
                                audioNormalMusic.play();
                                audioNormalMusic.loop = true;
                            }
                            else if (parseInt(document.getElementById("ScoreVal").textContent) == 10) {
                                audioNormalMusic.pause();
                                audioSigmentfinished.play();
                                var temp = "#bb0000";
                                var delay;
                                document.getElementById("lblScore").style.color = "red";
                                delay = setTimeout(() => {
                                    document.getElementById("lblScore").style.color = temp;
                                }, 400);
                                delay = setTimeout(() => {
                                    document.getElementById("lblScore").style.color = "red";
                                }, 600);
                                delay = setTimeout(() => {
                                    document.getElementById("lblScore").style.color = temp;
                                }, 800);
                                audioSuspenseMusic1.play();
                                audioSuspenseMusic1.loop=true;
                            }
                            else if (parseInt(document.getElementById("ScoreVal").textContent) == 20) {
                                audioSuspenseMusic1.pause();
                                audioSigmentfinished.play();
                                var temp = "#bb0000";
                                var delay;
                                document.getElementById("lblScore").style.color = "red";
                                delay = setTimeout(() => {
                                    document.getElementById("lblScore").style.color = temp;
                                }, 400);
                                delay = setTimeout(() => {
                                    document.getElementById("lblScore").style.color = "red";
                                }, 600);
                                delay = setTimeout(() => {
                                    document.getElementById("lblScore").style.color = temp;
                                }, 800);
                                audioSuspenseMusic2.play();
                                audioSuspenseMusic2.loop = true;
                            }
                            //making a new random pos for food

                            var min = Math.ceil(0);

                            var max = Math.floor(60);
                            var newXPos = Math.floor(Math.random() * (max - min) + min);
                            newXPos = newXPos * 25 +15;

                            max = Math.floor(27);
                            var newYPos = Math.floor(Math.random() * (max - min) + min);
                            newYPos = newYPos * 25 + 63;

                            var canBePlacedThere = true;

                            for (i = 1; (i < minesNum + 1) && (canBePlacedThere) ; i++) {
                                if (newXPos == parseInt(document.getElementById("Mine" + i).style.left)) {
                                    if (newYPos == parseInt(document.getElementById("Mine" + i).style.top))
                                        canBePlacedThere = false;
                                    else if (newYPos == parseInt(document.getElementById("Mine" + i).style.top) + 25)
                                        canBePlacedThere = false;
                                }
                                else if (newXPos == parseInt(document.getElementById("Mine" + i).style.left) + 25) {
                                    if (newYPos == parseInt(document.getElementById("Mine" + i).style.top))
                                        canBePlacedThere = false;
                                    else if (newYPos == parseInt(document.getElementById("Mine" + i).style.top) + 25)
                                        canBePlacedThere = false;
                                }
                            }

                            while (!canBePlacedThere) {
                                max = Math.floor(60);
                                newXPos = Math.floor(Math.random() * (max - min) + min);
                                newXPos = newXPos * 25 + 15;

                                max = Math.floor(27);
                                newYPos = Math.floor(Math.random() * (max - min) + min);
                                newYPos = newYPos * 25 + 63;

                                canBePlacedThere = true;

                                for (i = 1; (i < minesNum + 1) && (canBePlacedThere) ; i++) {
                                    if (newXPos == parseInt(document.getElementById("Mine" + i).style.left)) {
                                        if (newYPos == parseInt(document.getElementById("Mine" + i).style.top))
                                            canBePlacedThere = false;
                                        else if (newYPos == parseInt(document.getElementById("Mine" + i).style.top) + 25)
                                            canBePlacedThere = false;
                                    }
                                    else if (newXPos == parseInt(document.getElementById("Mine" + i).style.left) + 25) {
                                        if (newYPos == parseInt(document.getElementById("Mine" + i).style.top))
                                            canBePlacedThere = false;
                                        else if (newYPos == parseInt(document.getElementById("Mine" + i).style.top) + 25)
                                            canBePlacedThere = false;
                                    }
                                }

                            }
                            document.getElementById("Food").style.left = newXPos + 'px';
                            document.getElementById("Food").style.top = newYPos + 'px';
                            //end of new pos
                            audioFoodEaten.play();
                            speedUp();
                            hungry = false;
                        }
                    }
                    //end

                    //updating food pos
                    foodXMin = parseInt(document.getElementById("Food").style.left);
                    foodYMin = parseInt(document.getElementById("Food").style.top);

                    //adding Mines
                    if (!hungry) {
                        //making new pos for Mines
                        var min = Math.ceil(0);

                        var max = Math.floor(30);
                        var newXPos = Math.floor(Math.random() * (max - min) + min);
                        newXPos = newXPos * 50 +15;

                        max = Math.floor(14);
                        var newYPos = Math.floor(Math.random() * (max - min) + min);
                        newYPos = newYPos * 50 +63;

                        var canBePlacedThere = true;

                        if (newXPos == foodXMin && newYPos == foodYMin)
                            canBePlacedThere = false;

                        //making sure it doesnt spawn on the player or super close
                        if(canBePlacedThere){
                            //region is the area of 50px all arount the player
                            var regionXMin = xMin - 50;
                            var regionXMax = xMax + 50;
                            var regionYMin = yMin - 50;
                            var regionYMax = yMax + 50;

                            var MineXMin = newXPos;//left pos of the Mine
                            var MineYMin = newYPos;//top pos of the Mine
                            var MineXMax = newXPos + 50;//right pos of the Mine
                            var MineYMax = newYPos + 50;//down pos of the Mine
                            if (regionXMin > MineXMin && regionXMin < MineXMax) {
                                if (regionYMin > MineYMin && regionYMin < MineYMax)
                                    canBePlacedThere = false;
                                else if (regionYMax > MineYMin && regionYMax < MineYMax)
                                    canBePlacedThere = false;
                            }
                            if (canBePlacedThere)
                                if (regionXMax > MineXMin && regionXMax < MineXMax) {
                                    if (regionYMin > MineYMin && regionYMin < MineYMax)
                                        canBePlacedThere = false;
                                    else if (regionYMax > MineYMin && regionYMax < MineYMax)
                                        canBePlacedThere = false;
                                }
                        }

                        for (i = 1; (i < minesNum + 1) && (canBePlacedThere) ; i++) {
                            if (newXPos == parseInt(document.getElementById("Mine" + i).style.left) && newYPos == parseInt(document.getElementById("Mine" + i).style.top))
                                canBePlacedThere = false;
                        }

                        while (!canBePlacedThere) {
                            max = Math.floor(30);
                            newXPos = Math.floor(Math.random() * (max - min) + min);
                            newXPos = newXPos * 50 + 15;

                            max = Math.floor(14);
                            newYPos = Math.floor(Math.random() * (max - min) + min);
                            newYPos = newYPos * 50 + 63;

                            canBePlacedThere = true;

                            if (newXPos == foodXMin && newYPos == foodYMin)
                                canBePlacedThere = false;
                            for (i = 0; (i < minesNum) && (canBePlacedThere) ; i++) {
                                if (newXPos == parseInt(document.getElementById("Mine" + i).style.left) && newYPos == parseInt(document.getElementById("Mine" + i).style.top))
                                    canBePlacedThere = false;
                            }

                            //making sure it doesnt spawn on the player or super close
                            if (canBePlacedThere) {
                                //region is the area of 50px all arount the player
                                var regionXMin = xMin - 50;
                                var regionXMax = xMax + 50;
                                var regionYMin = yMin - 50;
                                var regionYMax = yMax + 50;

                                var MineXMin = newXPos;//left pos of the Mine
                                var MineYMin = newYPos;//top pos of the Mine
                                var MineXMax = newXPos + 50;//right pos of the Mine
                                var MineYMax = newYPos + 50;//down pos of the Mine
                                if (regionXMin > MineXMin && regionXMin < MineXMax) {
                                    if (regionYMin > MineYMin && regionYMin < MineYMax)
                                        canBePlacedThere = false;
                                    else if (regionYMax > MineYMin && regionYMax < MineYMax)
                                        canBePlacedThere = false;
                                }
                                if (canBePlacedThere)
                                    if (regionXMax > MineXMin && regionXMax < MineXMax) {
                                        if (regionYMin > MineYMin && regionYMin < MineYMax)
                                            canBePlacedThere = false;
                                        else if (regionYMax > MineYMin && regionYMax < MineYMax)
                                            canBePlacedThere = false;
                                    }
                            }
                        }

                        //end of new pos

                        minesNum++;
                        var Mine = document.createElement("IMG");
                        document.body.appendChild(Mine);
                        Mine.id = "Mine" + minesNum;

                        Mine.style.position = "absolute"
                        Mine.style.left = newXPos + 'px';
                        Mine.style.top = newYPos + 'px';
                        Mine.style.height = 50 + 'px';
                        Mine.style.width = 50 + 'px';
                        Mine.src = "Images/Mine.png";
                    }
                    //end

                }

            }
    </script>
        
       
    </form>
    </body>
</html>
