PShape kart;
HashMap<String,Coord> beaconCoords = new HashMap<String,Coord>();

void setup(){
  size(ww,wh);
  background(20,19,20);

  // Koordinater (130,50)(1150,460)
  kart = loadShape("img/bekk_beacon_kart.svg");

  Coord resepsjonen = new Coord(190,250);
  Coord youngstorget = new Coord(640,265);
  Coord kantina = new Coord(310,390);
  Coord fotorommet = new Coord(1110, 220);
  Coord fussball = new Coord(520, 440);

  beaconCoords.put("1111", resepsjonen);
  beaconCoords.put("2222", youngstorget);
  beaconCoords.put("3333", kantina);
  beaconCoords.put("4444", fotorommet);
  beaconCoords.put("5555", fussball);
}

void draw(){
  background(20,19,20);
  shape(kart, width/10, (height/2)-(kart.height/1.5), width-(width/5), 0);

  /*beacon_1_data();
  beacon_1 = new Beacon_1(width/2,height*0.25,data_noise_1);
  beacon_1.display();*/

  /*if (beaconData) {
    for (int i = 0; i < beaconData.length; i++) {
      Beacon_1 b = new Beacon_1(beaconData[i].beaconId/10, height*0.25, 100);
      b.display();    
    }
  }*/

  /*Beacon b1 = new Beacon(190, 250, 100, '1');
  b1.display();

  Beacon b2 = new Beacon(640, 265, 100, '2');
  b2.display();

  Beacon b3 = new Beacon(310, 390, 100, '3');
  b3.display();

  Beacon b4 = new Beacon(1110, 220, 100, '4');
  b4.display();

  Beacon b5 = new Beacon(520, 440, 100, '5');
  b5.display();*/

  Beacon b1 = new Beacon('1111', 0, 0);
  b1.display();
  Beacon b2 = new Beacon('2222', 0, 0);
  b2.display();
  Beacon b3 = new Beacon('3333', 0, 0);
  b3.display();
  Beacon b4 = new Beacon('4444', 0, 0);
  b4.display();
  Beacon b5 = new Beacon('5555', 0, 0);
  b5.display();
}




class Beacon {
  int radius;
  String beaconId;
  long timestamp;
  Coord coord;

  Beacon(_beaconId, _dist, _timestamp) {
    beaconId = _beaconId;
    radius = 100; // Noe med dist?
    coord = beaconCoords.get(beaconId);
  }

  void display(){
    noStroke();
    fill(253, 80, 88, 100);
    ellipse(coord.x, coord.y, radius, radius);
    fill(255);
    textSize(20);
    text(beaconId, coord.x-20, coord.y+8);
  }
}

class Coord {
  int x, y;

  Coord(_x, _y) {
    x = _x;
    y = _y;
  }
}
