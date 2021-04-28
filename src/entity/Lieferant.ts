import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToMany,
  ManyToOne,
} from "typeorm";
import { Addresse } from "./Adresse";
import { Zutaten } from "./Zutaten";
@Entity()
export class Lieferant {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  telefon: string;

  @ManyToMany((type) => Zutaten, (zutaten) => zutaten.lieferant)
  zutaten: Zutaten[];

  @ManyToOne((type) => Addresse, (addresse) => addresse.id)
  addresse: Addresse[];
}
