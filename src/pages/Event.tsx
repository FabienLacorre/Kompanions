import { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import moment from "moment";
import Button from "../components/Button";
import Input from "../components/Input";
import InputNumber from "../components/InputNumber";
import InputDate from "../components/InputDate";
import {
  eventByPetRequest,
  addEventRequest,
  deleteEventRequest,
} from "../request/events";
import { Table } from "react-bootstrap";
import { BsFillTrashFill } from "react-icons/bs";

const AddEvent = (props: any) => {
  const { id } = useSelector((state: any) => state.selectedPetReducer);

  const [newEvent, setNewEvent] = useState("");
  const [newEventNumberDays, setNewEventNumberDays] = useState(30);
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
      <span>Nom de l'évènement:</span>
      <div className="small-separator" />
      <Input
        value={newEvent}
        change={setNewEvent}
        placeholder="Nom de l'évenement"
      />
      <div className="small-separator" />
      <span>Date de création:</span>
      <div className="small-separator" />
      <InputDate value={dateEvent} change={setDateEvent} />
      <div className="small-separator" />
      <span>Nombre de jours avant la prochaine répétition:</span>
      <div className="small-separator" />
      <InputNumber
        value={newEventNumberDays}
        change={setNewEventNumberDays}
        placeholder="Nom de l'évenement"
      />
      <div className="small-separator" />
      <Button
        click={() =>
          addEvent({
            name: newEvent,
            date: dateEvent,
            numberDays: newEventNumberDays,
            petId: id,
          })
        }
      >
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
            <th>Prochaine répétition</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {props.events.map((e: any, index: number) => {
            return (
              <tr key={`TABLE_RACE_${index}`}>
                <td>{e.name}</td>
                <td>{moment(e.nextDate).format("DD/MM/YYYY")}</td>
                <td>
                  <Button
                    fullWidth={true}
                    click={() => deleteEvent(e._id)}
                    color="alert"
                  >
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
  const { id } = useSelector((state: any) => state.selectedPetReducer);
  const getEvents = async () => {
    const resp = await eventByPetRequest(id);
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
