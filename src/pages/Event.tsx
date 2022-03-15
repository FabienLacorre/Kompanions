import { useEffect, useState } from "react";
import moment from "moment";
import Button from "../components/Button";
import Input from "../components/Input";
import { eventsRequest } from "../request/events";
import { Table } from "react-bootstrap";

const AddEvent = () => {
  const [newEvent, setNewEvent] = useState("");
  const [dateEvent, setDateEvent] = useState(
    moment(new Date()).format("YYYY-MM-DD")
  );

  return (
    <div className="column-display">
      <span className="bold">Ajouter une évènement</span>
      <div className="small-separator" />
      <Input
        value={newEvent}
        change={setNewEvent}
        placeholder="Nom de l'évenement"
      />
      <div className="small-separator" />
      <input
        type="date"
        value={dateEvent}
        onChange={(e) => setDateEvent(e.target.value)}
      />
      <div className="small-separator" />
      <Button>Ajouter l'evenement</Button>
    </div>
  );
};

const EventList = () => {
  const [events, setEvents] = useState([]);

  const getEvents = async () => {
    const resp = await eventsRequest();
    console.log("EVENT LIST", resp.data);
    setEvents(resp.data);
  };

  useEffect(() => {
    getEvents();
  }, []);

  return (
    <div>
      <span className="bold">Liste des évènements</span>
      <div className="small-separator" />
      <Table striped bordered hover>
        <thead>
          <tr style={{ textAlign: "left" }}>
            <th>Nom</th>
            <th>Date</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {events.map((e: any, index: number) => {
            return (
              <tr key={`TABLE_RACE_${index}`}>
                <td>{e.name}</td>
                <td>{moment(e.date).format("DD/MM/YYYY")}</td>
                <td>
                  <Button color="alert">Supprimer</Button>
                </td>
              </tr>
            );
          })}
        </tbody>
      </Table>
    </div>
  );
};

const Event = () => {
  return (
    <div className="event-body animated-page">
      <h1 className="bold">Evenements </h1>
      <AddEvent />
      <hr />
      <EventList />
    </div>
  );
};

export default Event;
