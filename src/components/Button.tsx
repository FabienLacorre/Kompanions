type ButtonProps = {
  color?: string;
  rounded?: boolean;
  children?: any;
};

const Button = (props: ButtonProps) => {
  const rounded = props.rounded === true ? "rounded" : "";
  let color = "main-background";

  if (props.color === "secondary") {
    color = "secondary-background";
  }
  return (
    <button className={`button ${color} ${rounded}`}>
      <span className="bold">{props.children}</span>
    </button>
  );
};

export default Button;
