import { json } from '@sveltejs/kit';
import { weatherKey } from '$env/static/private';
import { error } from 'console';

export async function POST({ request }) {
	const { lat, lon } = await request.json();

	if (lat != 0 || lon != 0) {
		const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${weatherKey}`;
		try {
			const response = await fetch(url);
			if (!response.ok) {
				throw new Error(`Response status: ${response.status}`);
			}

			const result = await response.json();
			let data = result;
			console.log(result);
			return json({ data }, { status: 201 });
		} catch (error) {
			//@ts-ignore
			console.error(error.message);
		}
	} else {
		return json({ error }, { status: 429 });
	}

	console.log('Server has recieved info! Results being returned now!', lat, lon);
}
