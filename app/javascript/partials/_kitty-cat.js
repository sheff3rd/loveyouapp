var renderer, camera, scene, stats;
var particleSystem, particlesCount, uniforms, geometry;

$(document).ready(function() {
  $("#container").fadeOut("fast");

  $(".player").click(function() {
    $("#gif").css({ display: "initial" });

    $("#control").fadeOut("slow", () => (
      $("#container").fadeIn("slow")
    ));

    playAudio();
    initExperience();

  });
});

const playAudio = () => (
  $(".player").children('audio')[0].play()
)

const initExperience = () => {

  createScene()
  addParticles();
  animate();

}

const createScene = () => {

  // NOTE: Create settings first
  const WIDTH  = 400;
  const HEIGHT = 300;

  const VIEW_ANGLE = 45;
  const ASPECT     = WIDTH / HEIGHT;
  const NEAR       = 0.1;
  const FAR        = 10000;


  const container = document.querySelector("#container");

  renderer  = new THREE.WebGLRenderer();
  camera    = new THREE.PerspectiveCamera( VIEW_ANGLE, ASPECT, NEAR, FAR );
  scene     = new THREE.Scene();
  stats     = new Stats();

  scene.add( camera );

  renderer.setPixelRatio( window.devicePixelRatio );
  renderer.setSize( window.innerWidth, window.innerHeight );
  console.log(renderer);
  renderer.setClearColor( 0xffffff, 0);

  container.appendChild( renderer.domElement );

  window.addEventListener( 'resize', onWindowResize );
};

const addParticles = () => {

  particlesCount = 100000;

  uniforms = {
    pointTexture: { value: new THREE.TextureLoader().load( '/images/heart-particle.png' ) }
  };

  const shaderMaterial = new THREE.ShaderMaterial({
    uniforms:       uniforms,
    vertexShader:   document.getElementById( 'vertexshader' ).textContent,
    fragmentShader: document.getElementById( 'fragmentshader' ).textContent,

    blending:     THREE.AdditiveBlending,
    depthTest:    false,
    transparent:  true,
    vertexColors: true
  })

  geometry = new THREE.BufferGeometry();

  const radius    = 200;
  const positions = [];
  const colors    = [];
  const sizes     = [];

  const color = new THREE.Color();

  for ( let i = 0; i < particlesCount; i ++ ) {
    positions.push( ( Math.random() * 2 - 1 ) * radius );
    positions.push( ( Math.random() * 2 - 1 ) * radius );
    positions.push( ( Math.random() * 2 - 1 ) * radius );

    color.setHSL( i / particlesCount, 1.0, 0.5 );
    colors.push( color.r, color.g, color.b );

    sizes.push( 20 );
  }

  geometry.setAttribute( 'position', new THREE.Float32BufferAttribute( positions, 3 ) );
  geometry.setAttribute( 'color',    new THREE.Float32BufferAttribute( colors, 3 ) );
  geometry.setAttribute( 'size',     new THREE.Float32BufferAttribute( sizes, 1 ).setUsage( THREE.DynamicDrawUsage ) );

  geometry.rotateY(225);

  particleSystem = new THREE.Points( geometry, shaderMaterial );

  scene.add( particleSystem );
}

const animate = () => {
  requestAnimationFrame( animate );

  render();
  stats.update();
}

const render = () => {
  const time  = Date.now() * 0.005;
  const sizes = geometry.attributes.size.array;

  particleSystem.rotation.z = 0.01 * time;

  for ( let i = 0; i < particlesCount; i ++ ) {
    sizes[ i ] = 10 * ( 1 + Math.sin( 0.1 * i + time ) );
  }

  geometry.attributes.size.needsUpdate = true;
  renderer.render( scene, camera );
}

const onWindowResize = () => {
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();

  renderer.setSize( window.innerWidth, window.innerHeight );
}
