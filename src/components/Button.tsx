type ButtonProps = {
  click?: any;
  color?: string;
  rounded?: boolean;
  children?: any;
  fullWidth?: boolean;
};

const colorSelector = (c: string | undefined) => {
  let color = "";

  switch (c) {
    case "secondary":
      color = "secondary-background";
      break;
    case "alert":
      color = "alert-background";
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
  const fullWidth = props.fullWidth === true ? "full-width" : "";
  return (
    <button
      onClick={props.click}
      className={`button ${color} ${rounded} ${fullWidth}`}
    >
      <span className="bold">{props.children}</span>
    </button>
  );
};

export default Button;
