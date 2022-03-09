type InputProps = {
  rounded?: boolean;
  placeholder?: string;
};

const Input = (props: InputProps) => {
  const rounded = props.rounded === true ? "rounded" : "";
  return (
    <input
      placeholder={`${props.placeholder}`}
      className={`input ${rounded}`}
    />
  );
};
export default Input;
