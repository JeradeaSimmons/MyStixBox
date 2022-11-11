import { AppState } from "../AppState"
import { api } from "./AxiosService"


class StixService{

  async getStix(){
    const res = await api.get('api/stix')
    AppState.stix = res.data
  }

  async create(stix){
    const res = await api.post('/api/stix', stix)
    console.log('Created cigar', res);
    AppState.stix.push(res.data)
  }

}


export const stixService = new StixService()