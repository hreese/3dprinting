polyhedron(
  points=[ [10,10,0],[10,-10,0],[-10,-10,0],[-10,10,0], // vier punkte des fundaments
           [0,0,10*sqrt(2)]  ],                                 // spitze
  triangles=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],          // vier seiten
              [1,0,3],[2,1,3] ]                         // zwei dreiecke als basis
 );
