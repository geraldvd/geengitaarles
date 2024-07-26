<script>
	import { onMount } from 'svelte';
	import * as THREE from 'three';

	/**
	 * @type {HTMLDivElement}
	 */
	let container;

	onMount(() => {
		// Set up the scene, camera, and renderer
		const scene = new THREE.Scene();
		const camera = new THREE.PerspectiveCamera(75, 150 / 100, 0.1, 1000);
		const renderer = new THREE.WebGLRenderer({ alpha: true });
		renderer.setSize(300, 300); // Set the canvas size
		renderer.shadowMap.enabled = true; // Enable shadow maps
		container.appendChild(renderer.domElement);

		// Add a directional light with shadows
		const directionalLight = new THREE.DirectionalLight(0xffffff, 1);
		directionalLight.position.set(5, 10, 7.5);
		directionalLight.castShadow = true;
		directionalLight.shadow.mapSize.width = 1024;
		directionalLight.shadow.mapSize.height = 1024;
		scene.add(directionalLight);

		// Add ambient light for general illumination
		const ambientLight = new THREE.AmbientLight(0x404040, 1); // Soft white light
		scene.add(ambientLight);

		// Create the drum with a basic material that supports shadows
		const drumGeometry = new THREE.CylinderGeometry(4, 4, 1.5, 32);
		const drumMaterial = new THREE.MeshStandardMaterial({ color: 0x888888, roughness: 0.7 });
		const drum = new THREE.Mesh(drumGeometry, drumMaterial);
		drum.receiveShadow = true;
		scene.add(drum);

		// Create the drumsticks
		const stickGeometry = new THREE.BoxGeometry(0.15, 0.15, 4);
		const stickMaterial = new THREE.MeshStandardMaterial({ color: 0x8b4513, roughness: 0.7 });

		const stick1 = new THREE.Mesh(stickGeometry, stickMaterial);
		stick1.position.set(2, 1, 5);
		stick1.rotation.x = Math.PI / 6;
		stick1.castShadow = true;
		scene.add(stick1);

		const stick2 = new THREE.Mesh(stickGeometry, stickMaterial);
		stick2.position.set(-1, 1, 5);
		stick2.rotation.x = Math.PI / 6;
		stick2.castShadow = true;
		scene.add(stick2);

		// Add a plane to receive shadows
		const planeGeometry = new THREE.PlaneGeometry(10, 10);
		const planeMaterial = new THREE.ShadowMaterial({ opacity: 0.5 });
		const plane = new THREE.Mesh(planeGeometry, planeMaterial);
		plane.rotation.x = -Math.PI / 2;
		plane.position.y = -0.5;
		plane.receiveShadow = true;
		scene.add(plane);

		// Position the camera
		camera.position.z = 7;
		camera.position.y = 3;
		camera.lookAt(0, 0, 0);

		// Animation function
		function animate() {
			requestAnimationFrame(animate);

			// Animate the drumsticks
			stick1.rotation.x = Math.PI / 6 + 0.5 * Math.sin(Date.now() * 0.005);
			stick1.position.y = 1 + 0.5 * Math.cos(Date.now() * 0.005);

			stick2.rotation.x = Math.PI / 6 + 0.5 * Math.sin(Date.now() * 0.005 + Math.PI);
			stick2.position.y = 1 + 0.5 * Math.cos(Date.now() * 0.005 + Math.PI);

			renderer.render(scene, camera);
		}
		animate();

		// // Handle window resize
		// window.addEventListener('resize', onWindowResize);
		// function onWindowResize() {
		// 	camera.aspect = 300 / 300;
		// 	camera.updateProjectionMatrix();
		// 	renderer.setSize(300, 300);
		// }
	});
</script>

<div bind:this={container} class="container"></div>

<style>
	.container {
		width: 300px;
		height: 300px;
		position: relative;
		overflow: hidden;
		background: black;
	}
</style>
