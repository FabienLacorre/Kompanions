import Button from "./Button";

type CardProps = {
  title: string;
  subTitle: string;
  removeItem?: any;
  redirection?: any;
};

const Card = (props: CardProps) => {
  return (
    <div className="card-image">
      <div className="image"></div>
      <div className="small-padding-container ">
        <span className="bold">{props.title}</span>
        <div className="small-separator" />
        <span>{props.subTitle}</span>
      </div>
      <div className="small-padding-container row-display">
        <Button click={props.redirection}>Détails</Button>
        <div className="small-right-margin" />
        <Button click={props.removeItem}>Supprimer</Button>
      </div>
    </div>
  );
};

export default Card;
