type InputProps = {
  rounded?: boolean;
};

const Input = (props: InputProps) => {
  const rounded = props.rounded === true ? "rounded" : "";
  return <input className={`input ${rounded}`} />;
};
export default Input;
