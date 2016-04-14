PShape kart;
HashMap<String,Coord> beaconCoords = new HashMap<String,Coord>();
beaconShape bs;

void setup(){
  size(ww,wh);
  background(20,19,20);

  kart = loadShape("img/bekk_beacon_kart.svg");

  Coord resepsjonen = new Coord(width/6.74,height/2.8);
  Coord youngstorget = new Coord(width/2,height/2.65);
  Coord kantina = new Coord(width/4.13,height/1.8);
  Coord fotorommet = new Coord(width/1.15, height/3.19);
  Coord fussball = new Coord(width/2.46, height/1.59);
  Coord chillout = new Coord(width/1.55, height/2.75);
  Coord retrogaming = new Coord(width/7.5, height/1.8);

  beaconCoords.put("1111", resepsjonen);
  beaconCoords.put("2222", youngstorget);
  beaconCoords.put("3333", kantina);
  beaconCoords.put("4444", fotorommet);
  beaconCoords.put("5555", fussball);
  beaconCoords.put("6666", chillout);
  beaconCoords.put("7777", retrogaming);
}

void draw(){
   background(20);
   shape(kart, width/10, (height/2)-(kart.height/1.5), width-(width/5), 0);

    for (int i = 0; i < beaconData.length; i++) {
      Beacon b = new Beacon(beaconData[i].beaconId, beaconData[i].dist, beaconData[i].timestamp)
      b.display();
    }

}

class Beacon {
  int radius;
  String beaconId;
  Coord coord;
  int timestamp;

  Beacon(_beaconId, _dist, _timestamp) {
    beaconId = _beaconId;
    radius = _dist*pow(2,2.3);
    coord = beaconCoords.get(beaconId);
    timestamp = _timestamp;
  }

  void display() {
      //noFill();
      if(radius < 150){
        noStroke();
        fill(255,255,255,40);
      } else {
        noFill();
        stroke(255,255,255,50);
      }
      bs = new beaconShape(new PVector(coord.x, coord.y), radius);
      bs.build();
      bs.display();
  }
}

class beaconShape {
  PVector center = new PVector();
  PVector[] points;
  int size;
  int randomSize = [-7,45,12,6,17,-4,11,-4,17,-18];

  beaconShape(PVector start, _size) {
    size = _size;
    center.set(start);
  }

  void build() {
    int numberOfCorners = int(3+(size/30));
    //println(numberOfCorners);
    float t = 360/numberOfCorners;
    points = new PVector[numberOfCorners];
    float rotation = size;
    for (int i = 0; i < numberOfCorners; i++) {
      float xcorner = center.x + sin((radians(i * t)+rotation)) * (size + randomSize[i]);
      float ycorner = center.y + cos((radians(i * t)+rotation)) * (size + randomSize[i]);
      points[i] = new PVector(xcorner, ycorner);
    }
  }

  void display() {
    beginShape();
    for (int i = 0; i < points.length; i++) {
      vertex(points[i].x, points[i].y);
    }
    endShape(CLOSE);
  }

}

class Coord {
  int x, y;

  Coord(_x, _y) {
    x = _x;
    y = _y;
  }
}

void randomish(_input) {
  int output = int(_input / 20);
  return output;
}
