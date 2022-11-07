import Axios from 'axios'
import { baseURL } from '../env'
export const api = Axios.create({
  baseURL,
  timeout: 8000
})

const options = {
  method: 'GET',
  url: 'https://cigars.p.rapidapi.com/cigars',
  params: {page: '1'},
  headers: {
    'X-RapidAPI-Key': '5e47072081msh25c96270e87412ep1764efjsn778ba99ce8c2',
    'X-RapidAPI-Host': 'cigars.p.rapidapi.com'
  }
};

axios.request(options).then(function (response) {
	console.log(response.data);
}).catch(function (error) {
	console.error(error);
});