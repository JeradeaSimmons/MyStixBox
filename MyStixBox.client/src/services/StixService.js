import { AppState } from "../AppState"
import { api } from "./AxiosService"


class StixService{

  async getStix(){
    const res = await api.get('api/stix')
    AppState.stix = res.data
  }

}

export const stixService = new StixService()