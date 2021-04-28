import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToMany,
  OneToOne,
  JoinColumn,
} from "typeorm";
import { Addresse } from "./Adresse";
import { Auftrag } from "./Auftrag";
@Entity()
export class Kunde {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  vorname: string;

  @Column()
  telefon: number;

  @OneToOne((type) => Addresse)
  @JoinColumn()
  adresse: Addresse;

  @OneToMany((type) => Auftrag, (auftrag) => auftrag.kunde)
  auftraege: Auftrag[];
}
