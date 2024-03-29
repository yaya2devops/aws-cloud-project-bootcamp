import './SuggestedUserSection.css';
import SuggestedUserItem from '../components/SuggestedUserItem';

export default function SuggestedUsersSection(props) {
  return (
    <div className="suggested_users">
      <div className='suggested_users_title'>
        Connect with Developer
      </div>
      {props.users.map(user => {
        return <SuggestedUserItem display_name={user.display_name} handle={user.handle} />
      })}
    </div>
  );
}