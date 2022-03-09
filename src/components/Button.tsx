type ButtonProps = {
  click?: any;
  color?: string;
  rounded?: boolean;
  children?: any;
};

const colorSelector = (c: string | undefined) => {
  let color = "";

  switch (c) {
    case "secondary":
      color = "secondary-background";
      break;
    default:
      color = "main-background";
      break;
  }
  return color;
};

const Button = (props: ButtonProps) => {
  const rounded = props.rounded === true ? "rounded" : "";
  const color = colorSelector(props.color);

  return (
    <button onClick={props.click} className={`button ${color} ${rounded}`}>
      <span className="bold">{props.children}</span>
    </button>
  );
};

export default Button;
