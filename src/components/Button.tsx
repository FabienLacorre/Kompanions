type ButtonProps = {
  color?: string;
  rounded?: boolean;
  children?: any;
};

const Button = (props: ButtonProps) => {
  let color = "main-background";
  let rounded = "";
  if (props.rounded === true) {
    rounded = "rounded";
  }
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
