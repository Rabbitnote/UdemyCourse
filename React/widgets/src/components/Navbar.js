import React from 'react';
import '../styles/navbar.scss';
import Link from './Link';
const Navbar = () => {
    return (
        <div className="Navbar">
            <Link href='/'> Accordian</Link>
            <Link href='/list'> Search</Link>
            <Link href='/dropdown'> Dropdown</Link>
            <Link href='/translate'> Translate</Link>
        </div>
    );
};
export default Navbar;
