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

  if (beaconData) {
    for (int i = 0; i < beaconData.length; i++) {
      Beacon b = new Beacon(beaconData[i].beaconId, beaconData[i].dist, beaconData[i].timestamp)
      b.display();
    }
  }
}

class Beacon {
  int radius;
  String beaconId;
  long timestamp;
  Coord coord;

  Beacon(_beaconId, _dist, _timestamp) {
    beaconId = _beaconId;
    radius = _dist*3;
    coord = beaconCoords.get(beaconId);
  }

  void display() {
    if (coord) {
      noStroke();
      fill(253, 80, 88, 100);
      ellipse(coord.x, coord.y, radius, radius);
      fill(255);
      textSize(20);
      //text(beaconId, coord.x-20, coord.y+8);  
    }
  }
}

class Coord {
  int x, y;

  Coord(_x, _y) {
    x = _x;
    y = _y;
  }
}
