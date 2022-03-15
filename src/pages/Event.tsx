import { useEffect, useState } from "react";
import moment from "moment";
import Button from "../components/Button";
import Input from "../components/Input";
import {
  eventsRequest,
  addEventRequest,
  deleteEventRequest,
} from "../request/events";
import { Table } from "react-bootstrap";
import { BsFillTrashFill } from "react-icons/bs";

const AddEvent = (props: any) => {
  const [newEvent, setNewEvent] = useState("");
  const [dateEvent, setDateEvent] = useState(
    moment(new Date()).format("YYYY-MM-DD")
  );

  const addEvent = async (event: any) => {
    const resp = await addEventRequest(event);
    console.log("ADD EVENT", resp);
    const newEventsList = props.events.concat([resp.data]);
    props.setEvents(newEventsList);
  };

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
      <Button click={() => addEvent({ name: newEvent, date: dateEvent })}>
        Ajouter l'evenement
      </Button>
    </div>
  );
};

const EventList = (props: any) => {
  const deleteEvent = async (id: string) => {
    const resp = await deleteEventRequest(id);
    console.log("REMOVE EVENT", resp);
    const index = props.events.findIndex((e: any) => e._id === id);
    const newEventsList = props.events.filter(
      (e: any, i: number) => i !== index
    );
    props.setEvents(newEventsList);
  };

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
          {props.events.map((e: any, index: number) => {
            return (
              <tr key={`TABLE_RACE_${index}`}>
                <td>{e.name}</td>
                <td>{moment(e.date).format("DD/MM/YYYY")}</td>
                <td>
                  <Button click={() => deleteEvent(e._id)} color="alert">
                    <BsFillTrashFill />
                  </Button>
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
    <div className="event-body animated-page">
      <h1 className="bold">Evenements </h1>
      <AddEvent setEvents={setEvents} events={events} />
      <hr />
      <EventList setEvents={setEvents} events={events} />
    </div>
  );
};

export default Event;
