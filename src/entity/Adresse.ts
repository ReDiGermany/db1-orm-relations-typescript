import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";

import { Lieferant } from "./Lieferant";
@Entity()
export class Addresse {
  @PrimaryGeneratedColumn()
  id: number;

  @Column() strasse: string;
  @Column() hausnummer: string;
  @Column() ort: string;
  @Column() plz: string;

  @OneToMany((type) => Lieferant, (lieferant) => lieferant.id)
  lieferant: Lieferant[];
}
