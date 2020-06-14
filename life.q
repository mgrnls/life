input: (.Q.def `height`width`timer ! 30 40 100) .Q.opt .z.x;

height: input `height;
width: input `width;

if[`term in key input;
  height: -1 + value first system "tput lines";
  width: value first system "tput cols"
  ]

dim: (height; width);

grid: (til height) cross til width;
init: dim # (height * width) ? 100000b;

neighbours: grid +/:\: (1 0 -1 cross 1 0 -1) except enlist 0 0;

game: {[state]
  alive: sum each state ./:/: neighbours;
  dim # ((alive = 3) and not raze state) or (alive in 2 3) and raze state
  }

.z.ts: {
  new: game init;
  if[all (raze new) = raze init; -1 "Finished :)"; exit 0];
  `init set new;
  -1 "\033[2J\033[H" , "\n" sv " o" init;
  }

system "t " , string input `timer
