import { json } from '@sveltejs/kit';
import { weatherKey } from '$env/static/private';

let data = '';

export async function POST({ request }) {
	const { lat, lon } = await request.json();

	const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${weatherKey}`;
	try {
		const response = await fetch(url);
		if (!response.ok) {
			throw new Error(`Response status: ${response.status}`);
		}

		const result = await response.json();
		data = result;
		console.log(result);
	} catch (error) {
		//@ts-ignore
		console.error(error.message);
	}

	console.log('Server has recieved info! Results being returned now!', lat, lon);
	return json({ data }, { status: 201 });
}
