import Button from "./Button";

type CardProps = {
  title: string;
};

const Card = (props: CardProps) => {
  return (
    <div className="card-image">
      <div className="image"></div>
      <div className="small-padding-container ">
        <span className="bold">{props.title}</span>
      </div>
      {/* <div className="small-padding-container ">
        <span>
          Some quick example text to build on the card title and make up the
          bulk of the card's content.
        </span>
      </div> */}
      <div className="small-padding-container ">
        <Button>Détails</Button>
      </div>
    </div>
  );
};

export default Card;
