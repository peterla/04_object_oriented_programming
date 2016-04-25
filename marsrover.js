function Rover(x, y, orientation, plateau_width, plateau_height) {
  this.x = x;
  this.y = y;
  this.orientation = orientation;
  this.plateau_width = plateau_width;
  this.plateau_height = plateau_height;
}

Rover.prototype.move = function() {
  switch(this.orientation) {
    case 'N':
      if (this.y < (this.plateau_height - 1)) {
        this.y = this.y + 1;
      }
      break;
    case 'E':
      if (this.x < (this.plateau_width - 1)) {
        this.x = this.x + 1;
      }
      break;
    case 'S':
    if (this.y > 0) {
      this.y = this.y - 1;
    }
      break;
    case 'W':
      if (this.x > 0) {
        this.x = this.x - 1;
      }
      break;
    default:
  }
};

Rover.prototype.turnLeft = function() {

  var directions = [ 'N', 'E', 'S', 'W'];

  var index = directions.findIndex(
    function(element, index, array) {
      //console.log("this: ", this);
      if (this.orientation === element) {
        return true;
      }
    },
    this // This works because the calling object is an object of type Rover
  );

  console.log('before turning left ' + index);

  // Turn left!
  index = index - 1;
  if (index < 0) {
    index = 4 + index;
  }

  console.log('after turning left: ' + index);

  this.orientation = directions[index];

  // switch(this.orientation) {
  //   case 'N':
  //     this.orientation = 'W';
  //     break;
  //   case 'E':
  //     this.orientation = 'N';
  //     break;
  //   case 'S':
  //     this.orientation = 'E';
  //     break;
  //   case 'W':
  //     this.orientation = 'S';
  //     break;
  //   default:
  // }
};

Rover.prototype.turnRight = function() {

  var directions = [ 'N', 'E', 'S', 'W'];

  var index = directions.findIndex(
    function(element, index, array) {
      //console.log("this: ", this);
      if (this.orientation === element) {
        return true;
      }
    },
    this // This works because the calling object is an object of type Rover
  );

  console.log('before turning right ' + index);

  // Turn right!
  index = (index + 1) % 4;

  console.log('after turning right: ' + index);

  this.orientation = directions[index];

  // switch(this.orientation) {
  //   case 'N':
  //     this.orientation = 'E';
  //     break;
  //   case 'E':
  //     this.orientation = 'S';
  //     break;
  //   case 'S':
  //     this.orientation = 'W';
  //     break;
  //   case 'W':
  //     this.orientation = 'N';
  //     break;
  //   default:
  // }
};

var rover = new Rover(0, 0, 'N', 5, 5);

rover.turnLeft();
rover.turnRight();
rover.move();
